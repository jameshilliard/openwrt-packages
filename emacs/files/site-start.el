;; Emacs startup file for OpenWRT Emacs package
;;
;; Copyright (C) 2010 David Kuehling  <dvdkhlng TA gmx TOD de>
;; License: GPLv2 or later; NO WARRANTY.
;;

;; load documentation for internal functions.  This is skipped by loadup.el
;; when not dumping so we do it here.
(Snarf-documentation "DOC")

;; On openwrt 'ls' is provided by busybox.  That version of 'ls' does not
;; support the --dired option, make Emacs work around that.
(setq dired-use-ls-dired nil)

;; Allow us to output international characters to the terminal
(set-terminal-coding-system 'utf-8)

;; Do not show the menu bar.  What use is it without a mouse?
;; (Note that you can still use the menu via <Esc> x menu-bar-open
;; or tmm-menubar
(menu-bar-mode 0)

;; ugly work-around for load-history entry (require . t-mouse) added by
;; linux.el Not good, as it costs some memory.
(setq load-history
      (apply 'nconc (mapcar (lambda (v) (if (stringp (car v)) (list v) nil)) 
			    load-history)))