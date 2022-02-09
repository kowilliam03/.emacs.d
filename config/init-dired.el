;;; init-dired.el -*- lexical-binding: t no-byte-compile: t -*-

(with-eval-after-load 'dired
  (setq dired-listing-switches "-aBhl --group-directories-first"))

(provide 'init-dired)
