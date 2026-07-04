;; -*- lexical-binding: t; -*-

(use-package eglot
  :hook (python-base-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
			   '(python-base-mode . ("~/.local/bin/pyright-langserver" "--stdio"))))

(use-package treesit
  :ensure nil
  :config
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  )

(provide 'init-python)
