;;; init-evil.el -*- lexical-binding: t -*-

(when (maybe-require-package 'evil)
  (setq evil-want-keybinding nil
	evil-want-integration t
	evil-want-C-u-scroll t
	evil-want-C-i-jump nil)
  (add-hook 'after-init-hook 'evil-mode))


(when (maybe-require-package 'evil-collection)
  (with-eval-after-load 'evil
    (evil-global-set-key 'motion "j" 'evil-next-visual-line)
    (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
    
    (evil-set-initial-state 'message-buffer-mode 'normal)
    (evil-set-initial-state 'dired-mode 'emacs)

    (defalias 'evil-insert-state 'evil-emacs-state)
    (define-key evil-emacs-state-map (kbd "<escape>") 'evil-normal-state)
    
    (setq evil-emacs-state-cursor '(bar . 2))
    
    (evil-collection-init)
    ))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


(provide 'init-evil)
