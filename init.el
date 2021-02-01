(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 2.0)))))
    ))

;; Theme
(use-package modus-themes
  :ensure t
  :init
  (setq modus-themes-slanted-constructs t
	modus-themes-bold-constructs nil)
  (modus-themes-load-themes)
   :config
   (modus-themes-load-operandi)
   :bind ("<f5>" . modus-themes-toggle))

(use-package sml-mode
  :ensure t)

;; My setting 
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-set-key (kbd "<f1>") 'linum-mode)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


(defalias 'list-buffers 'ibuffer)

(add-to-list 'default-frame-alist
	     '(font . "Fira Code Retina-14"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(ace-window which-key use-package sml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0)))))
