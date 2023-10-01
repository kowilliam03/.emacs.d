;; -*- lexical-binding: t; -*-

(setq read-process-output-max (* 1024 1024))

(when (maybe-require-package 'eglot)
  (maybe-require-package 'consult-eglot)
  (add-hook 'python-mode-hook 'eglot-ensure))

(with-eval-after-load 'eglot
  (kwn/leader-key-def
    :keymaps 'eglot-mode-map
    "l"  '(:ignore t :which-key "lsp")
    "ll" 'eglot
    "lr" 'eglot-rename
    "lf" 'eglot-format-buffer
    )
  )


(provide 'init-eglot)
