;;; init-minibuffer.el -*- lexical-binding: t no-byte-compile: t -*-

(autoload 'vertico-mode "vertico" "" t)
(autoload 'consult-imenu "consult-imenu" "" t)
(require-package 'vertico)
(require-package 'consult)
(require-package 'orderless)
(require-package 'marginalia)
(require-package 'embark)


(vertico-mode)

(with-eval-after-load 'vertico
  (setq vertico-cycle t)

  (add-hook 'minibuffer-setup-hook
	    #'(lambda ()
		(setq-local completion-styles '(orderless)
			    completion-category-defaults nil
			    completion-category-overrides '((file (styles . (partial-completion)))))
		(setq-local completion-styles '(substring orderless))
		(set (make-local-variable 'face-remapping-alist)
		     '((default :height 140)))))

  (global-set-key (kbd "C-<tab>") 'consult-buffer)
  (global-set-key [remap switch-to-buffer] 'consult-buffer)
  (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
  (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
  (global-set-key [remap goto-line] 'consult-goto-line)
  (global-set-key (kbd "C-s") 'consult-line)
  (global-set-key (kbd "C-c C-f") 'consult-imenu)

  (marginalia-mode)
  
  (setq history-length 25)
  (savehist-mode 1)


  (global-set-key (kbd "C-;") 'embark-act)

  )

(provide 'init-minibuffer)
