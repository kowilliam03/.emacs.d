;; -*- lexical-binding: t; -*-

(global-set-key (kbd "C-x C-b") 'ibuffer)

(with-eval-after-load 'ibuffer
  (require 'all-the-icons-ibuffer)
  (all-the-icons-ibuffer-mode 1))

(provide 'init-buffer)
