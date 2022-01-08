;; -*- lexical-binding: t; -*-

(add-hook 'after-init-hook
	  #'(lambda ()
	      (require 'vertico)
	      (setq vertico-cycle t)
	      (vertico-mode)

	      (require 'marginalia)
	      (marginalia-mode)

	      (require 'savehist)	   
	      (setq history-length 25)
	      (savehist-mode 1)
	      ))

(with-eval-after-load 'vertico
  (require 'orderless)
  (setq completion-styles '(orderless)
	completion-category-defaults nil
	completion-category-overrides '((file (styles . (partial-completion)))))

  (require 'consult)
  (with-eval-after-load 'consult
    (global-set-key [remap switch-to-buffer] 'consult-buffer)
    (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
    (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
    (global-set-key [remap goto-line] 'consult-goto-line)
    (global-set-key (kbd "C-s") 'consult-line)
    )
  )



(provide 'init-minibuffer)
