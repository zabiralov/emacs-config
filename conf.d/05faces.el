;;; 99faces.el --- Emacs faces settings
;;;
;;; Time-stamp: <2024-10-07 16:34:41 azabiralov>
;;;
;;; Commentary:

;;; Code:


;; fonts and faces

(defun my-set-faces nil
  "Set custom faces."
  (interactive)

  (when (display-graphic-p)


    (set-face-attribute 'default nil
			:font "Source Code Pro 14"
			)

    (set-face-attribute 'show-paren-match nil
			:foreground "red"
			)

    (set-face-attribute 'minibuffer-prompt nil
			:font "Source Code Pro 14"
			)

    (set-face-attribute 'cursor nil
			:background "red"
			)

    (set-face-attribute 'fixed-pitch nil
			:font "Source Code Pro 14"
			)

    (set-face-attribute 'mode-line nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'mode-line-inactive nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'mode-line-buffer-id nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'mode-line-emphasis nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'mode-line-highlight nil
			:font "Source Code Pro 11"
			)

    (set-face-attribute 'header-line nil
			:font "Cantarell 10"
			)

    (set-face-attribute 'header-line-highlight nil
			:font "Cantarell 10"
			)

    (set-face-attribute 'package-name nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-description nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-built-in nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-external nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-available nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-new nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-held nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-disabled nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-installed nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-dependency nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-unsigned nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-incompat nil
			:font "Source Code Pro 10"
			)

    (set-face-attribute 'package-status-avail-obso nil
			:font "Source Code Pro 10"
			)

    ))


;; https://github.com/LionyxML/auto-dark-emacs
;;
(use-package auto-dark
  :ensure t
  :config
  (setq auto-dark-dark-theme 'material
	auto-dark-light-theme 'material-light
	auto-dark-polling-interval-seconds 5
	auto-dark-allow-osascript nil
	auto-dark-allow-powershell nil)

  (add-hook 'auto-dark-dark-mode-hook 'my-set-faces)
  (add-hook 'auto-dark-light-mode-hook 'my-set-faces)

  (auto-dark-mode t))


;;; 05faces.el ends here
