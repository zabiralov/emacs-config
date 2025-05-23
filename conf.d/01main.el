;;; 01global.el --- global Emacs configuration
;;;
;;; Time-stamp: <2025-05-23 17:48:50 azabiralov>
;;;
;;; Commentary:
;;
;;; Code:
;;
;;
;; overwrite environment variables
;;
(setenv "MANWIDTH" "80")
;;
;; global Emacs variables
;;
(setq inhibit-splash-screen t
      make-backup-files nil
      max-mini-window-height 0.5
      x-stretch-cursor t
      visible-bell nil
      ring-bell-function 'ignore
      kill-ring-max 3
      initial-scratch-message nil
      use-file-dialog nil
      split-height-threshold nil
      split-width-threshold nil
      default-justification 'full
      warning-minimum-level :error
      mouse-autoselect-window nil
      mouse-yank-at-point nil
      kill-whole-line t)


(dolist (my-init-frame-options '((fullscreen . maximized)))
  (add-to-list 'initial-frame-alist my-init-frame-options))


(dolist (my-def-frame-options '((fullscreen . maximized)))
  (add-to-list 'default-frame-alist my-def-frame-options))


;; enable/disable basic minor modes on startup
;;
(column-number-mode -1)
(desktop-save-mode -1)
(line-number-mode -1)
(scroll-bar-mode t)
(tool-bar-mode -1)
(blink-cursor-mode t)
(delete-selection-mode t)
(goto-address-mode t)
(pixel-scroll-precision-mode t)
(winner-mode t)
(global-tab-line-mode t)


;; menu-bar-mode :: menu bar
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Menu-Bar.html#Menu-Bar
;;
(setq yank-menu-length 20
      buffers-menu-max-size 20
      buffers-menu-buffer-name-length 20
      buffers-menu-show-status t)
(menu-bar-mode -1)


;; default new buffer settings
;;
(setq-default cursor-type 'bar
              tab-width 8
              fill-column 80
	      major-mode 'text-mode
              mode-line-format
              (list "%+ " "%4l %4c " "%6p " "%b " "%f " "%e" mode-line-modes))


;; Global hooks
;;
(add-hook 'minibuffer-setup-hook '(lambda() (highlight-symbol-mode -1)))

;; Update timestamp with file saving
(add-hook 'before-save-hook 'time-stamp)


;; human languages support
;;
(set-language-environment 'utf-8)
(setq default-input-method 'russian-computer)


;; reverse-im :: translate input sequences to english
;; https://github.com/a13/reverse-im.el
;;
(use-package reverse-im
  :ensure t
  :config
  (add-to-list 'reverse-im-input-methods "russian-computer")
  (reverse-im-mode t))


(use-package current-window-only
  :ensure t)

;;; 01main.el ends here
