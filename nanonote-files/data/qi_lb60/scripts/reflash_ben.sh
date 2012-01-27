#!/bin/bash
# version of me
__VERSION__="2011-12-12"

# use 'http' to download and flash images, use 'file' to flash images present in the <WORKING_DIR>
PROTOCOL="http"

# NanoNote images Version
VERSION="latest"

# working directory
WORKING_DIR="${HOME}/.qi/nanonote/ben/${VERSION}"

# URL to images ($URL/$VERSION/$[images])
BASE_URL_HTTP="http://downloads.qi-hardware.com/software/images/NanoNote/Ben"

# names of images
LOADER="openwrt-xburst-qi_lb60-u-boot.bin"
KERNEL="openwrt-xburst-qi_lb60-uImage.bin"
ROOTFS="openwrt-xburst-qi_lb60-root.ubi"

# options for reflash bootloader, kernel,  rootfs
B="FALSE"
K="FALSE"
R="FALSE"
ALL="TRUE"

while getopts d:t:v:l:hbkr OPTIONS
do
    case $OPTIONS in
    d)
	BASE_URL_HTTP="http://fidelio.qi-hardware.com/~xiangfu/build-nanonote/"
        VERSION=$OPTARG # override version by first argument
        WORKING_DIR=${VERSION}
	;;
    t)
        BASE_URL_HTTP="http://downloads.qi-hardware.com/software/images/NanoNote/Ben/testing"
        VERSION=$OPTARG
        WORKING_DIR=${VERSION}
        ;;
    v)
        VERSION=$OPTARG
        WORKING_DIR="${HOME}/.qi/nanonote/ben/${VERSION}"
        ;;
    l)
        PROTOCOL="file"
        VERSION="local"
        WORKING_DIR=$OPTARG
        ;;
    b)
	ALL="FALSE"
        B="TRUE"
        ;;
    k)
	ALL="FALSE"
        K="TRUE"
        ;;
    r)
	ALL="FALSE"
        R="TRUE"
        ;;
    *)
        echo "\

Usage: $0 [-d <dailybuild version>] [-t <testing version>] [-v <version>] [-l <path to local images>] [-b] [-k] [-r] [-h]
     -d <>  I will download and flash a [dailybuild] version of OpenWrt images

     -t <>  I will download and flash a [testing] version of OpenWrt images

     -v <>  I will download and flash a [specific] version of OpenWrt images

     -l <>  I will flash images present in folder: <arg>
            (missing files will be skipped)

     -b     flash bootloader(u-boot)
     -k     linux kernel
     -r     root filesystem

     -h     you already found out

without any arguments, I will download and flash the latest OpenWrt images
(includes bootloader, kernel and rootfs)

OpenWrt reflash script for Qi Hardware Ben NanoNote
written by: Mirko Vogt (mirko.vogt@sharism.cc)
            Xiangfu Liu (xiangfu@sharism.cc)

                                                     version: ${__VERSION__}
Please report bugs to developer@lists.qi-hardware.com"
        exit 1
        ;;
    esac
done

if [ "$ALL" == "TRUE" ]; then
	B="TRUE"
	K="TRUE"
	R="TRUE"
fi

# where the verbose output goes to
LOG_FILE="${WORKING_DIR}/log.txt"

# create working directory
mkdir -p ${WORKING_DIR}
# purge logfile if exists
date > "${LOG_FILE}"

log() {
    echo -e "$1"
    echo -e "$1" >> "${LOG_FILE}"
}

abort() {
    log "==="
    log "fatal error occured - ABORTED"
    log "==="
    log "$1"
    log "==="
    log "Before reporting this as a bug"
    log "Please ensure you're using the latest available version of this reflash script"
    log "http://downloads.qi-hardware.com/software/images/NanoNote/Ben/reflash_ben.sh"
    exit 1
}

progress_prepare () {
    WIDTH=$(tput cols)
    HEIGHT=$(tput lines)
    i=1
    DONE=0
    FITFR=0
    echo "Done:"
    echo -n "["
    tput cup $HEIGHT $WIDTH; echo -n "]"
}

progress_draw () {
    ILINE="$1"
    if [[ "$ILINE" =~ It\ will\ cause\ [[:digit:]]+\ times\ buffer\ transfer\.$ ]]; then
        TOTAL=${ILINE#*cause\ }
        TOTAL=${TOTAL%\ times*}
        FIT=$(echo "($WIDTH-2)/$TOTAL" | bc -l)
        tput cup $(( $HEIGHT-2 )) 7; echo -n 0/$TOTAL
    fi
    if [[ "$ILINE" =~ Checking\ [[:digit:]]+\ bytes\.\.\.\ Comparing\ [[:digit:]]+\ bytes\ -\ SUCCESS$ || "$ILINE" =~ Checking\ [[:digit:]]+\ bytes\.\.\.\ no\ check\!\ End\ at\ Page\:\ [[:digit:]]+ ]]; then
        FITFR=$(echo $FITFR+$FIT | bc -l)
        ((DONE++))
        tput cup $(( $HEIGHT-2 )) 7; echo -n $DONE/$TOTAL
        if [ $(echo "$FITFR >= 1" | bc) -eq 1 ]; then
            tput cup $HEIGHT $i;
            i=$(( $i+${FITFR%.*} ))
            for j in $(seq 1 ${FITFR%.*}); do echo -n "#"; done
            FITFR=0.${FITFR#*.}
        fi
    fi
}

progress_finish () {
    tput cup $HEIGHT $WIDTH
    echo
    tmp=$(<"${LOG_FILE}.err")
    cat "${LOG_FILE}.err" >> "${LOG_FILE}"
}

log "working dir:      ${WORKING_DIR}"
log "chosen method:    ${PROTOCOL} ${BASE_URL_HTTP}"
test ${VERSION} && log "chosen version:   ${VERSION}"
log "==="

if [ "$PROTOCOL" == "http" ]; then

    MD5SUMS_SERVER=$(wget -O - ${BASE_URL_HTTP}/${VERSION}/md5sums 2> /dev/null | grep -E "(${LOADER}|${KERNEL}|${ROOTFS})" | sort)
    [ "${MD5SUMS_SERVER}" ] || abort "can't fetch files from server"
    
    if [ ! -f "${WORKING_DIR}/${ROOTFS}" ] && [ -f "${WORKING_DIR}/${ROOTFS}.bz2" ] ; then
        log "found .ubi.bz2 rootfs, decompressing to .ubi ..."
        (cd "${WORKING_DIR}"; bzip2 -d "${ROOTFS}.bz2")
    fi

    MD5SUMS_LOCAL=$( (cd "${WORKING_DIR}" ; md5sum --binary "${LOADER}" "${KERNEL}" "${ROOTFS}" 2> /dev/null) | sort )

    if [ "${MD5SUMS_SERVER}" == "${MD5SUMS_LOCAL}" ]; then
        log "present files are identical to the ones on the server - do not download them again"
    else
        rm -f "${WORKING_DIR}/${LOADER}" "${WORKING_DIR}/${KERNEL}" "${WORKING_DIR}/${ROOTFS}"
	if [ "$B" == "TRUE" ]; then
		log "fetching bootloader..."
		wget \
		    -a "${LOG_FILE}" \
		    -O "${WORKING_DIR}/${LOADER}" \
		    "${BASE_URL_HTTP}/${VERSION}/${LOADER}"
	fi
	if [ "$K" == "TRUE" ]; then
		log "fetching kernel..."
		wget \
		    -a "${LOG_FILE}" \
		    -O "${WORKING_DIR}/${KERNEL}" \
		    "${BASE_URL_HTTP}/${VERSION}/${KERNEL}"
	fi
	if [ "$R" == "TRUE" ]; then
		log "try fetching .ubi.bz2 rootfs..."
		wget \
		    -a "${LOG_FILE}" \
		    -O "${WORKING_DIR}/${ROOTFS}.bz2" \
		    "${BASE_URL_HTTP}/${VERSION}/${ROOTFS}.bz2" && \
		    (cd ${WORKING_DIR}; bzip2 -d ${ROOTFS}.bz2)

		if [ "$?" != "0" ]; then
		    log "fetching .ubi rootfs..."
		    wget \
			-a "${LOG_FILE}" \
			-O "${WORKING_DIR}/${ROOTFS}" \
			"${BASE_URL_HTTP}/${VERSION}/${ROOTFS}"
		fi
	fi
    fi
fi

log "booting device..."
usbboot -c "boot" >> "${LOG_FILE}" || abort "can't boot device - xburst-tools setup correctly? device in boot-mode? device connected?"

if [ "$ALL" == "TRUE" ]; then
	log "clean bootloader env data ..."
	usbboot -c "nerase 2 2 0 0" >> "${LOG_FILE}" 2>&1
fi
if [ "$B" == "TRUE" ]; then
	log "flashing bootloader..."
	progress_prepare
	while read ILINE
		do progress_draw "$ILINE"
	done< <(usbboot -c "nprog 0 ${WORKING_DIR}/${LOADER} 0 0 -n" 2>"${LOG_FILE}.err" | tee -a "${LOG_FILE}")
	progress_finish
	test "${tmp}" && abort "error while flashing bootloader:\n${tmp}"
fi
if [ "$K" == "TRUE" ]; then
	log "flashing kernel..."
	progress_prepare
	while read ILINE
		do progress_draw "$ILINE"
	done< <(usbboot -c "nprog 1024 ${WORKING_DIR}/${KERNEL} 0 0 -n" 2>"${LOG_FILE}.err" | tee -a "${LOG_FILE}")
	progress_finish
	test "${tmp}" && abort "error while flashing kernel:\n${tmp}"
fi
if [ "$R" == "TRUE" ]; then
	log "erase nand rootfs partition..."
	usbboot -c "nerase 16 1024 0 0" >> "${LOG_FILE}" 2>&1
	log "flashing rootfs..."
	progress_prepare
	while read ILINE
		do progress_draw "$ILINE"
	done< <(usbboot -c "nprog 2048 ${WORKING_DIR}/${ROOTFS} 0 0 -n" 2>"${LOG_FILE}.err" | tee -a "${LOG_FILE}")
	progress_finish
	test "${tmp}" && abort "error while flashing rootfs:\n${tmp}"
fi

if [ "$ALL" == "TRUE" ]; then
	log "reboot device..."
	usbboot -c "reset" >> "${LOG_FILE}" 2>&1
fi

log "done"
