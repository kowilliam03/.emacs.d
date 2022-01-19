;; -*- lexical-binding: t; -*-

(autoload 'magit-status "Magit" "" t)
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'init-git)
