;; -*- lexical-binding: t; -*-


(setq gc-cons-threshold (* 100 1024 1024)) ; 100 MB


(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)


(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(setq package-enable-at-startup nil)


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
