;; -*- lexical-binding: t; -*-


(require 'company)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (define-key company-mode-map (kbd "M-/") 'company-complete)
  (define-key company-mode-map [remap completion-at-point] 'company-complete)
  (define-key company-mode-map [remap indent-for-tab-command] 'company-indent-or-complete-common)
  (define-key company-active-map (kbd "M-/") 'company-other-backend)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
  (define-key company-active-map (kbd "M-.") 'company-show-location)
  (setq-default company-tooltip-align-annotations t
		company-tooltip-limit 12
		company-idle-delay 0
		company-echo-delay nil
		company-minimum-prefix-length 1
		company-require-match nil
		company-dabbrev-ignore-case nil
		company-dabbrev-downcase nil
		company-dabberv-other-buffers 'all))
(global-set-key (kbd "C-M-i") 'company-complete)


(provide 'init-company)
