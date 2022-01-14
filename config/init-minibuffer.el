;; -*- lexical-binding: t; -*-

(add-hook 'after-init-hook
	  #'(lambda ()
	      (require 'vertico)
	      (setq vertico-cycle t)
	      (vertico-mode)
	      ))

(with-eval-after-load 'vertico
  (require 'orderless)
  (add-hook 'minibuffer-setup-hook
	    #'(lambda ()
		(setq-local completion-styles '(orderless)
			    completion-category-defaults nil
			    completion-category-overrides '((file (styles . (partial-completion)))))
		(setq-local completion-styles '(substring orderless))))

  (require 'consult)
  (with-eval-after-load 'consult
    (global-set-key (kbd "C-<tab>") 'consult-buffer)
    (global-set-key [remap switch-to-buffer] 'consult-buffer)
    (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
    (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
    (global-set-key [remap goto-line] 'consult-goto-line)
    (global-set-key (kbd "C-s") 'consult-line)
    )
  (require 'marginalia)
  (marginalia-mode)
  
  (require 'savehist)	   
  (setq history-length 25)
  (savehist-mode 1)
  )



(provide 'init-minibuffer)
