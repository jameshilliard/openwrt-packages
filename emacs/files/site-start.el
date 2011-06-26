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

;; For some reason emacs 23.2 does not come with colored comments by default
;; we fix this here (todo: chose a better color?)
(set-face-foreground 'font-lock-comment-face "blue")

;; f11/f12 are the volume keys on Ben NonoNote.  Use them as a replacement for
;; PgUp/PgDown
(global-set-key [f11] 'scroll-down)
(global-set-key [f12] 'scroll-up) 
