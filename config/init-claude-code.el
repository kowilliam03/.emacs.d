;; -*- lexical-binding: t; -*-

(use-package ghostel
  :ensure t
  :defer t
  :config
  (setopt ghostel-keymap-exceptions
		  (cons "C-z" ghostel-keymap-exceptions))

  (add-hook 'ghostel-mode-hook #'evil-emacs-state)
  (add-hook 'ghostel-mode-hook
			(lambda ()
			  (setq-local cursor-type 'bar)
			  (setq-local ghostel-ignore-cursor-change t)))
  )

(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :bind ("C-c C-'" . claude-code-ide-menu)
  :config
  (setq claude-code-ide-terminal-backend 'ghostel)
  (claude-code-ide-emacs-tools-setup)

  (add-hook 'ghostel-mode-hook (lambda () (display-line-numbers-mode -1)))
  )

(provide 'init-claude-code)
