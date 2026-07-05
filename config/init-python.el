;; -*- lexical-binding: t; -*-

(use-package pet
  :ensure t
  :config
  (add-hook 'python-base-mode-hook 'pet-mode -10))

(use-package eglot
  :hook (python-base-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
			   '(python-base-mode . ("~/.local/bin/pyright-langserver" "--stdio"))))

(use-package flymake-ruff
  :ensure t
  :hook (python-base-mode . flymake-ruff-load))

(use-package treesit
  :ensure nil
  :config
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  )

(use-package dape
  :ensure t)

(provide 'init-python)
