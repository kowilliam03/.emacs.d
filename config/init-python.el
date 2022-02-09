;;; init-python.el -*- lexical-binding: t no-byte-compile: t -*-

(add-hook 'python-mode-hook
	  #'(lambda ()
	      (require 'python)
	      ))

(with-eval-after-load 'python
  (setq indent-tabs-mode nil
	python-indent-offset 4)
  )


(provide 'init-python)
