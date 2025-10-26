;; -*- lexical-binding: t; -*-

(use-package fcitx
  :ensure t
  :defer
  :config
  (fcitx-aggressive-setup)
  :init
  (setq fcitx-active-evil-states '(insert emacs hybrid)
		fcitx-remote-command "fcitx5-remote"
		fcitx-use-dbus nil)
  )

(provide 'init-fcitx)
