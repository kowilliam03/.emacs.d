;; -*- lexical-binding: t; -*-

(use-package which-key
  :ensure nil
  :init
  (which-key-mode 1))

(use-package general
  :ensure t
  :config
  (general-override-mode 1)

  (general-create-definer +leader-def
	:states '(normal visual motion)
	:keymaps 'override
	:prefix "SPC"
	:global-prefix "C-SPC")

  (+leader-def
	"SPC" '(execute-extended-command :which-key "M-x")
	":"   '(eval-expression :which-key "eval expression")

	"f"   '(:ignore t :which-key "file")
	"f f" '(find-file :which-key "find file")
	"f s" '(save-buffer :which-key "save")
	"f r" '(consult-recent-file :which-key "recent files")
	"f R" '(rename-visited-file :which-key "rename file")
	"f d" '(dired-jump :which-key "dired")

	"b"   '(:ignore t :which-key "buffer")
	"b b" '(consult-buffer :which-key "switch buffer")
	"b k" '(kill-current-buffer :which-key "kill buffer")
	"b r" '(revert-buffer :which-key "revert buffer")

	"p"   '(:ignore t :which-key "project")
	"p p" '(project-switch-project :which-key "switch project")
	"p f" '(project-find-file :which-key "find file in project")
	"p b" '(consult-project-buffer :which-key "switch buffer in project")
	"p d" '(project-find-dir :which-key "find directory")
	"p g" '(consult-ripgrep :which-key "grep project")
	"p c" '(project-compile :which-key "compile")
	"p k" '(project-kill-buffers :which-key "kill project buffers")

	"g"   '(:ignore t :which-key "git")
	"g g" '(magit-status :which-key "status")
	"g b" '(magit-blame-addition :which-key "blame")
	"g l" '(magit-log-current :which-key "log")
	"g d" '(magit-diff-buffer-file :which-key "diff current file")

	"s"   '(:ignore t :which-key "search")
	"s s" '(consult-line :which-key "search buffer")
	"s b" '(consult-line-multi :which-key "search open buffers")
	"s i" '(consult-imenu :which-key "jump to symbol")
	"s f" '(consult-find :which-key "find file by name")

	"c"   '(:ignore t :which-key "code")
	"c a" '(eglot-code-actions :which-key "code actions")
	"c r" '(eglot-rename :which-key "rename")
	"c f" '(apheleia-format-buffer :which-key "format buffer")
	"c d" '(xref-find-definitions :which-key "find definition")
	"c D" '(xref-find-references :which-key "find references")
	"c i" '(eglot-find-implementation :which-key "find implementation")
	"c e" '(consult-flymake :which-key "list errors")
	"c R" '(eglot-reconnect :which-key "reconnect eglot")

	"d"   '(:ignore t :which-key "debug")
	"d d" '(dape :which-key "start/select")
	"d b" '(dape-breakpoint-toggle :which-key "toggle breakpoint")
	"d c" '(dape-continue :which-key "continue")
	"d n" '(dape-next :which-key "step over")
	"d i" '(dape-step-in :which-key "step in")
	"d o" '(dape-step-out :which-key "step out")
	"d r" '(dape-repl :which-key "repl")
	"d q" '(dape-quit :which-key "quit")

	"t"   '(:ignore t :which-key "toggle")
	"t t" '(treemacs :which-key "treemacs")
	"t l" '(display-line-numbers-mode :which-key "line numbers")
	"t w" '(toggle-truncate-lines :which-key "truncate lines")

	"w"   '(:ignore t :which-key "window")
	"w w" '(other-window :which-key "other window")
	"w d" '(delete-window :which-key "delete window")
	"w s" '(split-window-below :which-key "split below")
	"w v" '(split-window-right :which-key "split right")
	"w m" '(delete-other-windows :which-key "maximize window")

	"h"   '(:ignore t :which-key "help")
	"h f" '(describe-function :which-key "describe function")
	"h v" '(describe-variable :which-key "describe variable")
	"h k" '(describe-key :which-key "describe key")
	"h m" '(describe-mode :which-key "describe mode")

	"o"   '(:ignore t :which-key "tools/AI")
	"o a" '(gptel :which-key "gptel chat")
	"o m" '(gptel-menu :which-key "gptel menu")
	"o c" '(claude-code-ide-menu :which-key "claude code")

	"q"   '(:ignore t :which-key "quit")
	"q q" '(save-buffers-kill-terminal :which-key "quit emacs")
	"q f" '(delete-frame :which-key "delete frame")))

(provide 'init-keys)
