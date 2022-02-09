;;; init-package.el -*- lexical-binding: t no-byte-compile: t -*-

(autoload 'magit-submodule-add "magit" "" t)
(autoload 'magit-submodule-remove "magit" "" t)

(defun kwn/compile-package ()
  (interactive)
  (native-compile-async "~/.emacs.d/packages" 'recursively))

(defun kwn/install-package ()
  (interactive)
  (setq url (read-string "Git Repository's URL: "))
  (let ((pkg-dir "packages/"))
    (magit-submodule-add
     url
     (concat pkg-dir (file-name-base url))
     (file-name-base url)
     ))
  )

(defun kwn/remove-package ()
  (interactive)
  (magit-submodule-remove (list (magit-read-module-path "Remove module")) "--force" nil)
  )


(provide 'init-package)
