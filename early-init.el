;; -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)

(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq native-comp-async-report-warnings-errors nil)

(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8)
(setq system-time-locale "C")

(provide 'early-init)
