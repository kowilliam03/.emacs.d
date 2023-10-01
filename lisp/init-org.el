;; init-org.el -*- lexical-binding: t; -*-

(add-hook 'org-mode-hook #'org-modern-mode)

(dolist (face '(window-divider
		window-divider-first-pixel
		window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

(setq org-auto-align-tags nil
      org-tags-column 0
      org-catch-invisible-edits 'show-and-error
      org-special-ctrl-a/e t
      org-insert-heading-respect-content t
      org-hide-emphasis-markers t
      org-pretty-entities t
      org-ellipsis "…"
      )

(provide 'init-org)
