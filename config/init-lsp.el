;; -*- lexical-binding: t; -*-

(with-eval-after-load 'lsp-mode
  (setq lsp-log-io nil
	lsp-enable-folding  nil
	lsp-diagnostic-package :none
	lsp-enable-completion-at-point nil
	lsp-enable-symbol-highlighting nil
	lsp-ui-doc-enable nil
	lsp-signature-auto-activate nil
	lsp-signature-render-documentation nil
	lsp-restart 'auto-restart))


(add-hook 'python-mode-hook #'(lambda ()
				(require 'lsp-mode)
				(require 'lsp-pyright)
				(lsp)
				))

(provide 'init-lsp)
