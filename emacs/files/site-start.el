;; Emacs startup file for OpenWRT Emacs package
;;
;; Copyright (C) 2010 David Kuehling  <dvdkhlng TA gmx TOD de>
;;

;; load documentation for internal functions.  This is skipped by loadup.el
;; when not dumping so we do it here.
(Snarf-documentation "DOC")

;; Allow us to output international characters to the terminal
(set-terminal-coding-system 'utf-8)

;; Do not show the menu bar.  What use is it without a mouse?
;; (Note that you can still use the menu via <Esc> x menu-bar-open
;; or tmm-menubar
(menu-bar-mode 0)
