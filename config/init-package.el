;;; init-package.el -*- lexical-binding: t no-byte-compile: t -*-

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-quickstart t)

(package-initialize)

(defun kwn/compile-package ()
  (interactive)
  (native-compile-async "~/.emacs.d/elpa" 'recursively))


(setq my-packages
      '(evil
	evil-collection 
	company
	dashboard
	magit
	all-the-icons
	all-the-icons-dired
	all-the-icons-ibuffer
	general
	lsp-mode
	vertico
	consult
	embark
	marginalia
	doom-themes
	doom-modeline
	modus-themes
	orderless
	paredit
	undo-tree
	which-key
	yasnippet
	dash
	gcmh
	))


(defun require-package (package &optional min-version no-refresh)
  (unless (package-installed-p package min-version)
    (unless (or (assoc package package-archive-contents) no-refresh)
      (package-refresh-contents))
    (package-install package))
  )

(dolist (package my-packages)
  (require-package package)
  )

(provide 'init-package)
