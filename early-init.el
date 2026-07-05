;; -*- lexical-binding: t; -*-


(setq gc-cons-threshold most-positive-fixnum)

(setq native-comp-async-report-warnings-errors 'silent)


(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)


(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(setq read-process-output-max (* 1024 1024))
(setq package-quickstart t)


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(provide 'early-init)
