;; init-keybinding.el -*- lexical-binding: t; -*-

(when (maybe-require-package 'general)
  (add-hook 'after-init-hook
	    #'(lambda ()
		(general-auto-unbind-keys t)
		(general-evil-setup t)
		)))

(when (maybe-require-package 'which-key)
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

      "x" '(:ignore t :which-key "Execute")
      "xx" '(execute-extended-command :which-key "M-x") 
      "xs" '(save-buffer :which-key "Save")
      "xb" '(consult-buffer :which-key "Switch Buffer") 
      )
    )
  )



(provide 'init-keybinding)
