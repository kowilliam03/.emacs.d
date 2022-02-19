;;; init-buffer.el -*- lexical-binding: t no-byte-compile: t -*-

(require-package 'all-the-icons-ibuffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(with-eval-after-load 'ibuffer
  (all-the-icons-ibuffer-mode 1))

(provide 'init-buffer)
