;;; init-keybinding.el -*- lexical-binding: t no-byte-compile: t -*-

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(add-hook 'after-init-hook
	  #'(lambda ()
	      (general-auto-unbind-keys t)
	      (general-evil-setup t)
	      ))

(with-eval-after-load 'general
  (which-key-mode)
  (with-eval-after-load 'which-key
    (setq which-key-idle-delay 0.3)
    )

  (general-create-definer kwn/leader-key-def
    :states '(normal visual)
    :prefix "SPC"
    )
  
  (kwn/leader-key-def
    "t" '(:ignore t :which-key "toggles")
    "tt" '(consult-theme :which-key "Change Theme")

    "g" '(:ignore t :which-key "git")
    "gg" '(magit-status :which-key "Magit Status")
    )
  )

(provide 'init-keybinding)
