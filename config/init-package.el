;;; init-package.el -*- lexical-binding: t no-byte-compile: t -*-

(require 'package)
(require 'cl-lib)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-quickstart t)


;; Copy from purcell's emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (or (package-installed-p package min-version)
      (let* ((known (cdr (assoc package package-archive-contents)))
             (best (car (sort known (lambda (a b)
                                      (version-list-<= (package-desc-version b)
                                                       (package-desc-version a)))))))
        (if (and best (version-list-<= min-version (package-desc-version best)))
            (package-install best)
          (if no-refresh
              (error "No version of %s >= %S is available" package min-version)
            (package-refresh-contents)
            (require-package package min-version t)))
        (package-installed-p package min-version))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install optional package `%s': %S" package err)
     nil)))

(package-initialize)

;; (autoload 'magit-submodule-add "magit" "" t)
;; (autoload 'magit-submodule-remove "magit" "" t)

;; (defun kwn/compile-package ()
;;   (interactive)
;;   (native-compile-async "~/.emacs.d/packages" 'recursively))

;; (defun kwn/install-package ()
;;   (interactive)
;;   (setq url (read-string "Git Repository's URL: "))
;;   (let ((pkg-dir "packages/"))
;;     (magit-submodule-add
;;      url
;;      (concat pkg-dir (file-name-base url))
;;      (file-name-base url)
;;      ))
;;   )

;; (defun kwn/remove-package ()
;;   (interactive)
;;   (magit-submodule-remove (list (magit-read-module-path "Remove module")) "--force" nil)
;;   )


(provide 'init-package)
