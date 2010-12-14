;; Emacs startup file for OpenWRT Emacs package
;;
;; Copyright (C) 2010 David Kuehling  <dvdkhlng TA gmx TOD de>
;;

;; load documentation for internal functions.  This is skipped by loadup.el
;; when not dumping so we do it here.
(Snarf-documentation "DOC")

;; Allow us to output international characters to the terminal
(set-terminal-coding-system 'utf-8)
