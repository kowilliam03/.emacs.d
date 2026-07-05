;; -*- lexical-binding: t; -*-

(use-package pet
  :ensure t
  :config
  (add-hook 'python-base-mode-hook 'pet-mode -10))

(use-package eglot
  :hook (python-base-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
			   '(python-base-mode . ("~/.local/bin/pyright-langserver" "--stdio")))
  ;; Eglot logs every JSON-RPC message to *EGLOT events* by default; that
  ;; buffer grows unbounded under pyright's constant traffic. Disable it.
  (setq eglot-events-buffer-size 0))

(use-package eglot-booster
  :vc (:url "https://github.com/jdtsmith/eglot-booster" :rev :newest)
  :after eglot
  :config
  ;; emacs-lsp-booster is a separate external binary (e.g. `paru -S emacs-lsp-booster`);
  ;; skip activation until it's installed instead of erroring on every startup.
  (when (executable-find "emacs-lsp-booster")
    (eglot-booster-mode)))

(use-package flymake-ruff
  :ensure t
  :hook (python-base-mode . flymake-ruff-load))

(use-package treesit
  :ensure nil
  :config
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  )

(use-package dape
  :ensure t
  :config
  ;; debug sessions should default to the project root, not the buffer's
  ;; own directory (dape ships a 'debugpy template for Python out of the box)
  (setq dape-cwd-fn (lambda () (project-root (project-current)))))

(use-package apheleia
  :ensure t
  :init
  (apheleia-global-mode 1)
  :config
  ;; pyright provides no formatting capability, so eglot-format is a no-op
  ;; for Python; use ruff (format + import sort) via apheleia instead
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) 'ruff-isort)
  (setf (alist-get 'python-mode apheleia-mode-alist) 'ruff-isort))

(provide 'init-python)
