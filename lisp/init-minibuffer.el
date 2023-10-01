;; -*- lexical-binding: t; -*-

(when (maybe-require-package 'vertico)
  (add-hook 'after-init-hook 'vertico-mode)

  (when (maybe-require-package 'embark)
    (with-eval-after-load 'vertico
      (define-key vertico-map (kbd "C-c C-o") 'embark-export)
      (define-key vertico-map (kbd "C-c C-c") 'embark-act)))

  (when (maybe-require-package 'consult)
    (with-eval-after-load 'consult
      (global-set-key (kbd "C-s") 'consult-line)
      (global-set-key [remap switch-to-buffer] 'consult-buffer)
      (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
      (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
      (global-set-key [remap goto-line] 'consult-goto-line)))

  (when (maybe-require-package 'embark-consult)
    (with-eval-after-load 'embark
      (require 'embark-consult)
      (add-hook 'embark-collect-mode-hook 'embark-consult-preview-minor-mode)))

  (maybe-require-package 'consult-flycheck)
  )

(when (maybe-require-package 'marginalia)
  (add-hook 'after-init-hook 'marginalia-mode))
      

(provide 'init-minibuffer)
