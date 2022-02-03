;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum)

(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;(setq package-native-compile t)
(setq comp-async-report-warnings-errors nil)

(setq package-enable-at-startup nil
      package--init-file-ensured t)

(setq initial-major-mode 'fundamental-mode)

(provide 'early-init)
