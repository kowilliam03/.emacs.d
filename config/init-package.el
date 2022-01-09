;; -*- lexical-binding: t; -*-
;; Install package from Github

(defun kwn/compile-package ()
  (interactive)
  (native-compile-async "../packages" 'recursively))


(provide 'init-package)
