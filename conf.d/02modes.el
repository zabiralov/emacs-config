;;; 02modes.el
;;;
;;; Time-stamp: <2025-05-05 15:38:08 azabiralov>
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
  ("H-<SPC>" . grugru))

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
	  company-yasnippet))
  (setq   company-tooltip-limit 15
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
  (setq transient-levels-file (expand-file-name "var/treemacs/transient/levels.el" user-emacs-directory)
	transient-values-file (expand-file-name "var/treemacs/transient/values.el" user-emacs-directory)
	transient-history-file (expand-file-name "var/treemacs/transient/history.el" user-emacs-directory)))

  (use-package flycheck
    :diminish
    :config
    (setq flycheck-display-errors-delay 0.5
	  flycheck-indication-mode 'left-fringe
	  flycheck-gcc-language-standard "c17"
	  flycheck-gcc-pedantic t
	  flycheck-cppcheck-checks '("warning" "style" "information"))
    (add-to-list 'flycheck-gcc-include-path "~/src/include/")
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

(use-package transpose-frame
  :bind
  ("H-<up>" . rotate-frame)
  ("H-<down>" . transpose-frame))

(use-package treemacs
  :ensure t
  :config
  (setq treemacs-collapse-dirs 0
	treemacs-deferred-git-apply-delay 0.5
	treemacs-display-in-side-window t
	treemacs-file-event-delay 2000
	treemacs-file-follow-delay 0.1
	treemacs-follow-after-init nil
	treemacs-expand-after-init t
	treemacs-hide-dot-git-directory t
	treemacs-indentation '(10 px)
	treemacs-indentation-string " "
	treemacs-is-never-other-window nil
	treemacs-missing-project-action 'remove
	treemacs-move-files-by-mouse-dragging t
	treemacs-move-forward-on-expand nil
	treemacs-no-png-images t
	treemacs-no-delete-other-windows t
	treemacs-project-follow-cleanup nil
	treemacs-persist-file (expand-file-name "var/treemacs/persist" user-emacs-directory)
	treemacs-position 'left
	treemacs-read-string-input 'from-child-frame
	treemacs-litter-directories nil
	treemacs-project-follow-into-home t
	treemacs-show-cursor nil
	treemacs-show-hidden-files nil
	treemacs-silent-filewatch t
	treemacs-silent-refresh t
	treemacs-sorting 'alphabetic-numeric-asc
	treemacs-select-when-already-in-treemacs 'move-back
	treemacs-space-between-root-nodes nil
	treemacs-tag-follow-cleanup t
	treemacs-tag-follow-delay 1.5
	treemacs-wide-toggle-width 50
	treemacs-width 30
	treemacs-width-increment 1
	treemacs-width-is-initially-locked t
	treemacs-workspace-switch-cleanup nil)
  (treemacs-follow-mode -1)
  (treemacs-git-mode -1)
  :bind
  ("H-y" . treemacs)
  :hook (after-init . treemacs))

(use-package minimap
  :defer t
  :config
  (setq minimap-window-location 'right
	minimap-minimum-width 20
	minimap-buffer-name "*minimap*"
	minimap-hide-scroll-bar t)
  :bind ("H-m" . minimap-mode))

(use-package vterm
  :config
  (setq vterm-always-compile-module t
	vterm-max-scrollback 100000
	vterm-min-window-width 40
	vterm-kill-buffer-on-exit t))

(use-package vterm-toggle
  :config
  (setq vterm-toggle-scope 'dedicated
	vterm-toggle-hide-method 'delete-window
	vterm-toggle-reset-window-configration-after-exit t)
  :bind ("H-t" . vterm-toggle)
  :hook
  (vterm-toggle-show . goto-address-mode))

(use-package winner
  :defer t
  :config
  (setq winner-ring-size 100)
  :bind ("H-z" . winner-undo))

(use-package bufferbin
  :defer t
  :config
  (setq bufferbin-window-width 30
	bufferbin-direction 'right
	bufferbin-buffer-name "*bufferbin*"
	bufferbin-header nil)
  :bind ("H-b" . bufferbin))

(use-package bufferfile
  :defer t
  :config
  (setq bufferfile-use-vc t)
  :bind
  ("H-r" . bufferfile-rename)
  ("H-<delete>" . bufferfile-delete))

(use-package buffer-flip
  :defer t
  :config
  (setq buffer-flip-skip-patterns '("^\\*.+\\*\\b"))
  :bind
  (("M-<tab>" . buffer-flip)
   :map buffer-flip-map
   ( "M-<tab>" .   buffer-flip-forward)
   ( "M-S-<tab>" . buffer-flip-backward)
   ( "M-ESC" .     buffer-flip-abort)))

(use-package autoscratch
  :defer t
  :config
  (setq initial-major-mode 'autoscratch-mode
	autoscratch-reset-default-directory t)
  (setq autoscratch-triggers-alist
	'(("[(;]"         . (emacs-lisp-mode))
	  ("#"            . (autoscratch-select
			     '(("perl"   . (cperl-mode))
			       ("ruby"   . (ruby-mode))
			       ("conf"   . (conf-unix-mode))
			       ("shell"  . (shell-script-mode)))))
	  ("[-a-zA-Z0-9]" . (text-mode))
	  ("/"            . (c-mode))
	  ("."            . (fundamental-mode)))))

(use-package buffer-move
  :defer t
  :config
  (setq buffer-move-stay-after-swap t)
  :bind
  ("H-<up>" . buf-move-up)
  ("H-<down>" . buf-move-down)
  ("H-<left>" . buf-move-left)
  ("H-<right>" . buf-move-right))

(use-package dedicated
  :bind
  ("H-`" . dedicated-mode)
  ("C-x d" . dedicated-mode))



;;; 02modes.el ends here
