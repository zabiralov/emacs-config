;;; 02modes.el
;;;
;;; Time-stamp: <2025-02-27 13:27:57 azabiralov>
;;;
;;; Commentary:
;;
;;; Code:


(use-package move-dup
  :demand t
  :bind (("M-p"   . move-dup-move-lines-up)
         ("C-M-p" . move-dup-duplicate-up)
         ("M-n"   . move-dup-move-lines-down)
         ("C-M-n" . move-dup-duplicate-down)))

(use-package multiple-cursors
  :config
  (setq mc/insert-numbers-default 1
        mc/match-cursor-style nil))

(use-package epa-file
  :config
  (setq epa-file-select-keys "none"
        epa-file-cache-passphrase-for-symmetric-encryption t
        epg-pinentry-mode 'loopback
        epa-popup-info-window nil))

(use-package aggressive-indent
  :diminish
  :config
  (setq aggressive-indent-comments-too t
        aggressive-indent-sit-for-time 0.01)

  (global-aggressive-indent-mode t))

(use-package smartparens
  :diminish
  :config
  (setq sp-show-pair-delay 0.1
        sp-undo-pairs-separately t
        sp-autoinsert-pair t
        sp-autodelete-pair nil)
  
  (smartparens-global-mode t))

(use-package git-gutter
  :diminish
  :config
  (setq git-gutter:update-interval 1
        git-gutter:added-sign "+"
        git-gutter:deleted-sign "-"
        git-gutter:modified-sign "*")
  (global-git-gutter-mode t))

(use-package grugru
  :config
  (grugru-define-global 'symbol '("yes" "no"))
  (grugru-define-global 'symbol '("Yes" "No"))
  (grugru-define-global 'symbol '("YES" "NO"))
  (grugru-define-global 'symbol '("y" "n"))
  (grugru-define-global 'symbol '("Y" "N"))
  (grugru-define-global 'symbol '("t" "nil"))
  (grugru-define-global 'symbol '("true" "false"))
  (grugru-define-global 'symbol '("True" "False"))
  (grugru-define-global 'symbol '("on" "off"))
  (grugru-define-global 'symbol '("On" "Off"))
  (grugru-define-global 'symbol '("ON" "OFF"))
  (grugru-define-global 'symbol '("1" "0"))
  :bind
  ("S-<SPC>" . grugru))

(use-package ws-butler
  :diminish
  :config
  (setq ws-butler-keep-whitespace-before-point t
        ws-butler-convert-leading-tabs-or-spaces t
        ws-butler-global-exempt-modes '(makefile-mode))
  :hook ((prog-mode . ws-butler-mode)
         (yaml-mode . ws-butler-mode)))

(use-package paren
  :diminish
  :config
  (setq show-paren-style 'parenthehis
        show-paren-delay 0)
  (show-paren-mode t))

(use-package highlight-symbol
  :diminish
  :config
  (setq highlight-symbol-idle-delay 0
        highlight-symbol-highlight-single-occurrence nil
        highlight-symbol-colors '("HotPink1"))
  :bind
  ("M-h" . highlight-symbol-next)
  ("C-M-h" . highlight-symbol-prev))

(use-package company
  :diminish
  :config
  (setq company-backends
        '(company-dabbrev
          company-dabbrev-code
          company-semantic
          company-capf
          company-keywords
          company-yasnippet)
        company-tooltip-limit 15
        company-idle-delay 0
        company-minimum-prefix-length 2
        company-dabbrev-minimum-length 2
        company-dabbrev-other-buffers nil
        company-dabbrev-ignore-case t
        company-dabbrev-downcase nil
        company-dabbrev-code-other-buffers t
        company-dabbrev-code-ignore-case t
        company-keywords-ignore-case t)

  (global-company-mode t))

(use-package column-enforce-mode
  :diminish
  :config
  (setq column-enforce-column 80
	column-enforce-comments t)
  (column-enforce-mode t))

(use-package indent-guide
  :diminish
  :demand t
  :config
  (setq indent-guide-char ">"
	indent-guide-delay 0.5
	indent-guide-threshold 1
	indent-guide-recursive t)

  (indent-guide-global-mode))

(use-package autorevert
  :diminish
  :config
  (setq auto-revert-interval 10
	auto-revert-stop-on-user-input t
	auto-revert-mode t))

(use-package eldoc
  :config
  (setq eldoc-idle-delay 0.6
	eldoc-print-after-edit nil
	eldoc-minor-mode-string nil))

(use-package savehist
  :config
  (setq savehist-file "~/.emacs.d/var/savehist/minibuffer")
  (savehist-mode t))

(use-package super-save
  :demand t
  :diminish
  :config
  (setq super-save-auto-save-when-idle t
	super-save-idle-duration 10
	auto-save-default nil)
  (super-save-mode t))

(use-package uniquify
  :demand t
  :config
  (setq uniquify-buffer-name-style 'forward
	uniquify-strip-common-suffix t
	uniquify-separator "/"
	uniquify-after-kill-buffer-p t
	uniquify-ignore-buffers-re "^\\*"))

(use-package transient
  :config
  (setq transient-levels-file "~/emacs/var/transient/levels.el"
	transient-values-file "~/emacs/var/transient/values.el"
	transient-history-file "~/emacs/var/transient/history.el"))

(use-package flycheck
  :diminish
  :config
  (setq flycheck-display-errors-delay 0.5
	flycheck-indication-mode 'left-fringe)

  (global-flycheck-mode t))


(use-package flycheck-mmark)

(use-package yasnippet
  :diminish
  :config
  (setq yas-snippet-dirs '("~/emacs/snippets")
	yas-indent-line "fixed"
	yas-trigger-symbol ">>>"
	yas-also-indent-empty-lines t
	yas-choose-keys-first t
	yas-wrap-around-region t)
  (yas-reload-all)
  :bind
  ("<f4>" . yas-expand)
  ("M-<f4>" . yas-insert-snippet)
  :hook ((prog-mode . yas-minor-mode)
	 (yaml-mode . yas-minor-mode)))

(use-package diminish
  :demand t
  :config
  (diminish 'auto-revert-mode)
  (diminish 'yas-minor-mode))

(use-package auto-dim-other-buffers
  :config
  (setq auto-dim-other-buffers-dim-on-focus-out t
	auto-dim-other-buffers-dim-on-switch-to-minibuffer t))

(auto-dim-other-buffers-mode t)

(use-package vterm
  :config
  (setq vterm-shell "/bin/bash"
	vterm-max-scrollback 100000
	vterm-kill-buffer-on-exit t
	vterm-always-compile-module t
	vterm-min-window-width 80
	vterm-term-environment-variable "xterm-256color"))

;; (use-package vterm-toggle
;;   :demand t
;;   :config
;;   (setq vterm-toggle-fullscreen-p nil
;;         vterm-toggle-project-root t
;;         vterm-toggle-cd-auto-create-buffer t
;;         vterm-toggle-reset-window-configration-after-exit t)

;;   :bind
;;   ("<f11>" . vterm-toggle))


;;; 02modes.el ends here
