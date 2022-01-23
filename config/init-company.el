;;; init-company.el -*- lexical-binding: t no-byte-compile: t -*-

(autoload 'global-company-mode "company" "" t)

(setq tab-always-indent 'complete)
;;(defvar default-completion-styles completion-styles)
(add-to-list 'completion-styles 'initials t)

(add-hook 'prog-mode-hook
	  #'(lambda ()
	      ;; Config for company-mode
	      (setq-default company-tooltip-align-annotations t
			    company-tooltip-limit 12
			    company-idle-delay 0
			    company-echo-delay nil
			    company-minimum-prefix-length 1
			    company-require-match nil
			    company-dabberv-other-buffers 'all
			    )
	      ;;(setq company-backend '((company-capf company-dabbrev)))
	      ;; Enable Company-mode
	      (global-company-mode))
	  )

(with-eval-after-load 'company
  ;; Keybinding
  (define-key company-mode-map (kbd "M-/") 'company-complete)
  (define-key company-mode-map [remap completion-at-point] 'company-complete)
  (define-key company-mode-map [remap indent-for-tab-command] 'company-indent-or-complete-common)
  (define-key company-active-map (kbd "M-/") 'company-other-backend)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
  (define-key company-active-map (kbd "M-.") 'company-show-location)
  (global-set-key (kbd "C-M-i") 'company-complete)

  ;; (when (display-graphic-p)
  ;;   (require 'company-box)
  ;;   (add-hook 'company-mode-hook 'company-box-mode))
  )
	  

(provide 'init-company)
