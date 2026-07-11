;; -*- lexical-binding: t; -*-

(use-package consult
  :ensure t
  :defer t
  :init
  (setq xref-show-xrefs-function #'consult-xref)
  (setq xref-show-definitions-function #'consult-xref))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   :map minibuffer-local-map
   ("C-c C-e" . embark-export)))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(provide 'init-search)
