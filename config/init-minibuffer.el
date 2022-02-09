;;; init-minibuffer.el -*- lexical-binding: t no-byte-compile: t -*-

(autoload 'vertico-mode "vertico" "" t)
(autoload 'consult-imenu "consult-imenu" "" t)


(vertico-mode)

(with-eval-after-load 'vertico
  (setq vertico-cycle t)

  (require 'orderless)
  (add-hook 'minibuffer-setup-hook
	    #'(lambda ()
		(setq-local completion-styles '(orderless)
			    completion-category-defaults nil
			    completion-category-overrides '((file (styles . (partial-completion)))))
		(setq-local completion-styles '(substring orderless))
		(set (make-local-variable 'face-remapping-alist)
		     '((default :height 140)))))

  (require 'consult)
  (global-set-key (kbd "C-<tab>") 'consult-buffer)
  (global-set-key [remap switch-to-buffer] 'consult-buffer)
  (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
  (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
  (global-set-key [remap goto-line] 'consult-goto-line)
  (global-set-key (kbd "C-s") 'consult-line)
  (global-set-key (kbd "C-c C-f") 'consult-imenu)

  (require 'marginalia)
  (marginalia-mode)
  
  (require 'savehist)	   
  (setq history-length 25)
  (savehist-mode 1)


  (require 'embark)
  (global-set-key (kbd "C-;") 'embark-act)

  )

(provide 'init-minibuffer)
