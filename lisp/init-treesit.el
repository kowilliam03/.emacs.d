;; -*- lexical-binding: t; -*-

(use-package treesit-auto
  :demand t
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))


(provide 'init-treesit)
