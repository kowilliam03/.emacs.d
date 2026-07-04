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
  (corfu-preselect 'prompt)
  :init
  (global-corfu-mode)
  :config
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.2)
  (setq corfu-preview-current nil)
  (setq corfu-preselect nil)

  (setq corfu-separator ?\s)
  (setq corfu-quit-at-boundary 'separator)
 )

(use-package emacs
 :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  )


(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  )


(provide 'init-complete)
