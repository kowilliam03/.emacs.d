;; -*- lexical-binding: t; -*-

(autoload 'magit-status "magit" "" t)
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'init-git)
