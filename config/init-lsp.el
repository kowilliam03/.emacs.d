;;; init-lsp.el -*- lexical-binding: t no-byte-compile: t -*-

(autoload 'lsp "lsp" "" t)

(with-eval-after-load 'lsp-mode
  ;; Improve lsp-mode‘s performance
  (setq lsp-log-io nil
	lsp-enable-folding  nil
	lsp-diagnostic-package :none
	lsp-enable-snippet nil
	lsp-lens-enable nil
	lsp-enable-symbol-highlighting nil
	lsp-ui-doc-enable nil
	lsp-headerline-breadcrumb-enable nil
	lsp-ui-sideline-enable nil
	lsp-modeline-code-actions-enable nil
	lsp-modeline-diagnostics-enable nil
	lsp-modeline-workspace-status-enable nil
	lsp-signature-auto-activate nil
	lsp-signature-render-documentation nil
	lsp-eldoc-enable-hover nil
	lsp-enable-links nil
	lsp-restart 'auto-restart
	))


(add-hook 'python-mode-hook #'(lambda ()
				(require 'lsp-pyright)
				(setq lsp-pyright-multi-root nil)
				(lsp)
				))

(provide 'init-lsp)
