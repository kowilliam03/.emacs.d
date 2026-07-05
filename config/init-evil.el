;; -*- lexical-binding: t; -*-

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-disable-insert-state-bindings t)
  :config
  (evil-mode 1)
  (evil-set-initial-state 'ghostel-mode 'emacs)

  (add-hook 'evil-insert-state-entry-hook
			(lambda ()
			  (setq cursor-type 'bar)))

  (add-hook 'evil-insert-state-exit-hook
			(lambda ()
			  (setq cursor-type 'box)))
  )

(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode 1)
  (setq evil-escape-key-sequence "jk")
  )

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(provide 'init-evil)
