;;; init-lsp.el -*- lexical-binding: t no-byte-compile: t -*-

(autoload 'lsp "lsp" "" t)

(with-eval-after-load 'lsp-mode
  ;; Improve lsp-mode‘s performance
  (setq lsp-log-io nil
	lsp-enable-folding  nil
	lsp-diagnostic-package :none
	lsp-enable-completion-at-point t
	lsp-enable-symbol-highlighting nil
	lsp-ui-doc-enable nil
	lsp-signature-auto-activate nil
	lsp-signature-render-documentation nil
	lsp-restart 'auto-restart))


(add-hook 'python-mode-hook #'(lambda ()
				(lsp)
				))

(provide 'init-lsp)
