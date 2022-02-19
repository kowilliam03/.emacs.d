;;; init-git.el -*- lexical-binding: t no-byte-compile: t -*-

(require-package 'magit)

(autoload 'magit-status "magit" "" t)
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'init-git)
