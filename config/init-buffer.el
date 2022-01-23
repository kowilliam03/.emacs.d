;;; init-buffer.el -*- lexical-binding: t no-byte-compile: t -*-

(autoload 'all-the-icons-ibuffer-mode "all-the-icons-ibuffer" "" t)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(with-eval-after-load 'ibuffer
  (all-the-icons-ibuffer-mode 1))

(provide 'init-buffer)
