;; -*- lexical-binding: t; -*-

(use-package pet
  :ensure t
  :defer t
  :init
  (add-hook 'python-base-mode-hook 'pet-mode -10))

(use-package eglot
  :hook (python-base-mode . eglot-ensure)
  :config
  ;; :language-id override: eglot would otherwise derive "python-base" from
  ;; the mode name. This was required for ty (which silently skipped
  ;; documents whose languageId wasn't "python" -- didOpen accepted, but
  ;; zero diagnostics); kept here defensively for pyrefly since its handling
  ;; of a non-standard languageId isn't documented either way.
  (add-to-list 'eglot-server-programs
			   '((python-base-mode :language-id "python") . ("pyrefly" "lsp")))
  ;; Eglot logs every JSON-RPC message to *EGLOT events* by default; that
  ;; buffer grows unbounded under the server's constant traffic. Disable it.
  (setq eglot-events-buffer-size 0))

(use-package eglot-booster
  :vc (:url "https://github.com/jdtsmith/eglot-booster" :rev :newest)
  :after eglot
  :config
  (when (executable-find "emacs-lsp-booster")
    (eglot-booster-mode)))

(use-package eldoc-box
  :ensure t
  :after eglot
  :hook (eglot-managed-mode . eldoc-box-hover-mode)
  :config
  (set-face-attribute 'eldoc-box-border nil)
  (set-face-attribute 'eldoc-box-body nil)
  )

(use-package flymake-ruff
  :ensure t
  :config
  ;; eglot takes over flymake-diagnostic-functions when it manages a buffer,
  ;; so hooking python-base-mode is too early -- the ruff backend gets
  ;; clobbered. Re-add it after eglot connects.
  (defun kwn/flymake-ruff-load-in-eglot ()
    (when (derived-mode-p 'python-base-mode)
      (flymake-ruff-load)))
  (add-hook 'eglot-managed-mode-hook #'kwn/flymake-ruff-load-in-eglot))

(use-package treesit
  :ensure nil
  :config
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  )

(use-package dape
  :ensure t
  :commands (dape dape-breakpoint-toggle dape-continue dape-next
                  dape-step-in dape-step-out dape-repl dape-quit)
  :config
  ;; debug sessions should default to the project root, not the buffer's
  ;; own directory (dape ships a 'debugpy template for Python out of the box)
  (setq dape-cwd-fn (lambda () (project-root (project-current)))))

(use-package apheleia
  :ensure t
  :init
  (apheleia-global-mode 1)
  :config
  ;; pyrefly provides no formatting capability, so eglot-format is a no-op
  ;; for Python; use ruff (format + import sort) via apheleia instead
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) 'ruff-isort)
  (setf (alist-get 'python-mode apheleia-mode-alist) 'ruff-isort))

(provide 'init-python)
