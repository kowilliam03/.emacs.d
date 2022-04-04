;;; init-theme.el -*- lexical-binding: t no-byte-compile: t -*-

(setq custom-safe-themes t)

(add-hook 'after-init-hook
	  #'(lambda ()
	      (setq modus-themes-italic-constructs t
		    modus-themes-bold-constructs nil
		    modus-themes-region '(bg-only no-extend))
	      (modus-themes-load-themes)
	      (modus-themes-load-operandi)
	      (doom-modeline-mode 1))
	  )

;; modeline setting
(with-eval-after-load 'doom-modeline
  (setq doom-modeline-height 12)
  )

(provide 'init-theme)
