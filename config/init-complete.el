;; -*- lexical-binding: t; -*-

(use-package vertico
  :ensure t
  :init
  (vertico-mode 1)
  (setq vertico-cycle t)
  )

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1)
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
  )

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)
  (corfu-preselect 'valid)       
  :init
  (global-corfu-mode)
  :config
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.1)    
  (setq corfu-auto-prefix 2)    
  (setq corfu-preview-current nil)
  (setq corfu-separator ?\s)
  (setq corfu-quit-at-boundary 'separator)
  (setq corfu-quit-no-match 'separator))

(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

(use-package corfu-popupinfo
  :ensure nil
  :after corfu
  :hook (corfu-mode . corfu-popupinfo-mode))

(use-package corfu-history
  :ensure nil
  :after corfu
  :init
  (corfu-history-mode 1))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  )


(use-package cape
  :ensure t
  :init
  (add-hook 'completion-at-point-functions #'cape-file 90)
  (add-hook 'completion-at-point-functions #'cape-dabbrev 90)
  (add-hook 'completion-at-point-functions #'cape-keyword 90)
  )

(use-package tempel
  :ensure t
  :bind (("M-+" . tempel-complete)
		 ("M-*" . tempel-insert))
  :init
  (defun +tempel-setup-capf ()
	(add-hook 'completion-at-point-functions #'tempel-expand 10 t))
  (add-hook 'prog-mode-hook #'+tempel-setup-capf)
  (add-hook 'text-mode-hook #'+tempel-setup-capf))

(use-package tempel-collection
  :ensure t
  :after tempel)


(provide 'init-complete)
