;;; init-complete.el -*- lexical-binding: t -*-

(setq tab-always-indent 'complete)

(when (maybe-require-package 'orderless)
  (with-eval-after-load 'vertico
    (require 'orderless)
    (setq completion-styles '(orderless basic))))

(setq completion-category-defaults nil
      completion-category-overrides nil)
(setq completion-cycle-threshold 4)

(when (maybe-require-package 'corfu)
  (setq-default corfu-auto t)
  (setq-default corfu-quit-no-match 'separator)
  (add-hook 'after-init-hook 'global-corfu-mode)

  (when (featurep 'corfu-popupinfo)
    (with-eval-after-load 'corfu
      (corfu-popupinfo-mode)))
  )


(provide 'init-complete)
