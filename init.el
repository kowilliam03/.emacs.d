;; The default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 500 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "***  Emacs loaded in %s with %d gargabe collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-udpate-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe))

(setq inhibit-startup-message t)
(setq default-directory "~/")

(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable the toolbar

(tooltip-mode -1)       ; Disable tooltips
(set-fringe-mode 10)    ; Give some breathing room

(menu-bar-mode -1)      ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)


(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
               treemacs-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(pcase system-type
  ((or 'gnu/linux 'windows-nt)
   (set-face-attribute 'default nil
                       ;; :font "Iosevka"
                       :font "JetBrains Mono"
                       :weight 'regular
		         :height 150
                       )
   (set-face-attribute 'fixed-pitch nil
                       :font "Iosevka"
                       :weight 'light
		         :height 150
                       )
   )
  )

(use-package general
  :config
  (general-create-definer kwn/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")


  (kwn/leader-keys
    ;; Buffer
    "b" '(:ignore t :which-key "Buffer")

    ;; Files
    "f" '(:ignore t :which-key "Files")

    ;; Magit
    "g" '(:ignore t :which-key "Magit")

    ;; Help
    "h" '(:ignore t :which-key "Help")
    "hf" '(helpful-function :which-key "key")
    "hk" '(helpful-key :which-key "key")
    "hv" '(helpful-variable :which-key "key")

    ;; Toggle
    "t" '(:ignore t :which-key "Toggles")

    ;; Open
    "o" '(:ignore t :which-key "Open")

    ;; Search
    "s" '(:ignore t :which-key "Search")
    "ss" '(swiper :which-key "Search in file")

    ;; Execute
    "x" '(:ignore t :which-key "Execute")
    "xs" '(save-buffer :which-key "Save Buffer")
    )
  )

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(defun open-init-file ()
  "Open the init file."
  (interactive)
  (find-file user-init-file)
  )

(defun open-init-org-file ()
  "Open the init file."
  (interactive)
  (find-file "~/.emacs.d/Emacs.org")
  )

(kwn/leader-keys
  "fp" '(open-init-org-file :which-key "Config Org file")
  "fP" '(open-init-file :which-key "Config file")
  )

;; Theme 
(use-package doom-themes
  :defer t
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  )

(load-theme 'doom-solarized-light  t)

(kwn/leader-keys
  "tt" '(counsel-load-theme :which-key "choose theme")
  )

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 20)
  (doom-modeline-lsp t)
 )

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.2)
  )

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)	
         ("C-l" . ivy-done)
         ("C-d" . ivy-swich-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  )

(use-package ivy-rich
  :init
  (ivy-rich-mode 1)
  )

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil) ;; Don't start searches with ^
  (counsel-mode 1)
  )

(kwn/leader-keys
  "xf" '(counsel-find-file :which-key "Open file")
  "xx" '(counsel-M-x :which-key "Execute Command")

  "bi" '(ibuffer :which-key "IBuffer")
  )

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key)
  )

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

  (kwn/leader-keys
    "ts" '(hydra-text-scale/body :which-key "scale-text")
  )

;; Org Mode Configuration

(defun efs/org-font-setup()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
			  '(("^ *\\([-]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1))))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(defun efs/org-mode-setup()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (efs/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t))
 )

;; Automatically tangle Emacs.org config file when save it
(defun efs/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/.emacs.d/Emacs.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'efs/org-babel-tangle-config)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t))
 )

(push '("conf-unix" . conf-unix) org-src-lang-modes)

;; This is neeed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(defun efs/lsp-mode-setup()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :defer t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-delay 2)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp)

(use-package lsp-ivy)

(use-package python
  :hook (python-mode . lsp-deferred)
  :config
  (setq python-indent-guess-indent-offset-verbose nil)
  )

(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  )

(use-package company-anaconda
  :init (require 'rx)
  :after (company)
  :config
  (add-to-list 'company-backends 'company-anaconda)
  )

(use-package lsp-pyright
  :defer t
  :config
  (setq lsp-pyright-disable-language-service nil
        lsp-pyright-disable-organize-imports nil
        lsp-pyright-auto-import-completions t
        lsp-pyright-use-library-code-for-types t
        )
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)))
  )

(use-package term
  :config
  (setq explicit-shell-file-name "powershell")
  ;; (setq explicit-zsh-args '())
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(defun efs/configure-eshell ()
  ;; Save command history when commands are entered
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate bufferrrr for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Bind some useful keys for evil-mode
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") ' counsel-esh-history)
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
  (evil-normalize-keymaps)

  (setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ingoredups t
        eshell-scroll-to-bottom-on-input t))

(use-package eshell-git-prompt)

(use-package eshell
  :hook (eshell-first-time-mode . efs/configure-eshell)
  :config

  (with-eval-after-load 'esh-opt
    (setq eshell-destroy-buffer-when-process-dies t)
    (setq eshell-visual-commands '("htop" "zsh" "vim")))

  (eshell-git-prompt-use-theme 'powerline))

(use-package company
  :defer t
  :diminish
  :after lsp-mode
  :config
  (setq company-dabbrev-other-buffers t
        company-dabbrev-code-other-buffers t)
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 2)
  (company-idle-delay 0.0))

(use-package company-box
  :diminish
  :functions (all-the-icons-faicon
              all-the-icons-material
              all-the-icons-octicon
              all-the-icons-alltheicon)
  :hook (company-mode . company-box-mode)
  :init (setq company-box-enable-icon (display-graphic-p))
  ;;:init (setq company-box-enable-icon
  )

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package treemacs
  :defer t
  :config
  (setq treemacs-no-png-images n
        treemacs-width 24)
  )

(use-package treemacs-all-the-icons
  :after treemacs
  :config
  (treemacs-load-theme "all-the-icons")
)

(use-package treemacs-evil
  :after (treemacs evil)
  )

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :config
  (treemacs-icons-dired-mode)
  )

;; Open Sidebar
(kwn/leader-keys
  "op" '(treemacs :which-key "sidebar")
  )

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  )

(kwn/leader-keys
  "gg" '(magit-status :which-key "Magit status")
   )

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package undo-tree
:init
(global-undo-tree-mode))

;; prevent backup files
(setq make-backup-files nil)
(setq package-native-compile t)

;; Silence compiler warnings as they can be pretty disruptive
(setq comp-async-report-warnings-errors nil)

(set-default-coding-systems 'utf-8)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
