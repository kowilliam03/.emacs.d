(setq inhibit-startup-message t)
(tool-bar-mode -1) 
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

(use-package which-key
      :ensure t
      :config
      (which-key-mode))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (add-hook 'after-init-hook 'global-company-mode)

  ;; remove unused backends
  (setq company-backends (delete 'company-semantic company-backends))
  (setq company-backends (delete 'company-eclim company-backends))
  (setq company-backends (delete 'company-xcode company-backends))
  (setq company-backends (delete 'company-clang company-backends))
  (setq company-backends (delete 'company-bbdb company-backends))
  (setq company-backends (delete 'company-oddmuse company-backends))
  )

;; Org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package counsel
  :ensure t
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  ))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package acme-theme
  :ensure t
  :config
  (load-theme 'acme t))

(use-package ox-reveal
:ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/npm/reveal.js")
(setq org-reveal-mathjax t)

(use-package htmlize
:ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(require 'evil)
(evil-mode 1)

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; Avoid generate file~
(setq make-backup-files nil)
(global-set-key (kbd "<f1>") 'linum-mode)
(scroll-bar-mode -1)

;; Put autosave files and backup files in ~/.emacs.d
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't
(make-directory "~/.emacs.d/autosaves/" t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/myinit.org"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(setq cursor-type 'bar)

;; Highlight current line
(global-hl-line-mode t)

;; disable audio notifications
(setq ring-bell-function 'ignore)
