;; -*- lexical-binding: t; -*-

(setq custom-safe-themes t)

(require 'modus-themes)

(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs nil
      modus-themes-themes-region '(bg-only no-extend))

(modus-themes-load-themes)
(modus-themes-load-operandi)

(define-key global-map (kbd "<f5>") #'modus-themes-toggle)


(provide 'init-theme)
