;;; 01global.el --- global Emacs configuration
;;;
;;; Time-stamp: <2024-10-21 01:15:45 azabiralov>
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
      kill-ring-max 100
      initial-major-mode 'text-mode
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
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(delete-selection-mode t)
(goto-address-mode t)
(pixel-scroll-precision-mode t)


;; menu-bar-mode :: menu bar
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Menu-Bar.html#Menu-Bar
;;
(setq yank-menu-length 20
      buffers-menu-max-size 20
      buffers-menu-buffer-name-length 20
      buffers-menu-show-status t)
(menu-bar-mode t)


;; default new buffer settings
;;
(setq-default cursor-type 'bar
              tab-width 8
              fill-column 80
              major-mode 'text-mode
              indent-tabs-mode t
              mode-line-format
              (list "%+ " "%4l %4c " "%6p " "%b " "%f " "%e" mode-line-modes))


;; Global hooks
;;
(add-hook 'minibuffer-setup-hook '(lambda() (highlight-symbol-mode -1)))

;; Update timestamp with file saving
(add-hook 'before-save-hook 'time-stamp)

;; List of modes which should be enabled for buffer locally.
(defun my-buffer-enabled-modes ()
  "List of buffer-local modes enabled by default."
  (interactive)
  (auto-insert-mode t)
  (goto-address-mode t)
  (rainbow-delimiters-mode t)
  (prettify-symbols-mode t)
  (highlight-symbol-mode t)
  (hl-line-mode t))


(add-hook 'prog-mode-hook 'my-buffer-enabled-modes)
(add-hook 'text-mode-hook 'my-buffer-enabled-modes)


;; human languages support
;;
(set-language-environment 'utf-8)
(setq default-input-method 'russian-computer)


;; reverse-im :: translate input sequences to english
;; https://github.com/a13/reverse-im.el
;;
(use-package reverse-im
  :config
  (add-to-list 'reverse-im-input-methods "russian-computer")
  (reverse-im-mode t))



;;; 01main.el ends here
