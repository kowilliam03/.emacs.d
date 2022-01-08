;; -*- lexical-binding: t -*-


(add-hook 'after-init-hook
	  #'(lambda ()
	      (require 'evil)
	      (setq evil-want-integration t
		    evil-want-keybinding nil
		    evil-want-C-u-scroll t
		    evil-want-C-i-jump nil)
	      (evil-mode 1)))

(with-eval-after-load 'evil
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)


  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)
  (evil-set-initial-state 'dired-mode 'emacs)
  )

(global-set-key (kbd "<escape>") 'keyborad-escape-quit)

(provide 'init-evil)
