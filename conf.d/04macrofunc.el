;;; 05macrofunc.el --- keyboard macroses and custom functions
;;;
;;; Time-stamp: <2025-05-05 14:50:41 azabiralov>
;;;
;;; Commentary:

;;; Code:

(defun my-recreate-scratch nil
  "Recreate a scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

(defun my-switch-language ()
  "Print input info and switch Ispell language."
  (interactive)
  (my-cycle-ispell-languages)
  (message "%s" "Input language was switched ...")
  (sit-for 2)
  (message nil))

(defun my-replace-under-point (arg)
  "Replace word under point with query ARG."
  (interactive "sReplace word under point with: ")
  (forward-word)
  (let ((end (point)))
    (backward-word)
    (kill-ring-save (point) end)
    (replace-string (current-kill 0) arg)))

(defun my-fill-paragraph ()
  "Fill paragraph by width."
  (interactive)
  (fill-paragraph 1))

(defun my-delete-whole-line ()
  "Delete (not kill) the current line."
  (interactive)
  (save-excursion
    (delete-region
     (progn (forward-visible-line 0) (point))
     (progn (forward-visible-line 1) (point)))))


(bind-key "C-k" 'kill-whole-line)

(bind-key "H-k" 'kill-buffer-and-window)
(bind-key "H-a" 'beginning-of-buffer)
(bind-key "H-e" 'end-of-buffer)
(bind-key "H-w" 'other-window)
(bind-key "H-h" 'mark-whole-buffer)
(bind-key "H-v" 'yank)
(bind-key "H-d" 'duplicate-line)
(bind-key "H-c" 'keyboard-quit)
(bind-key "H-f" 'find-file)
(bind-key "H-s" 'save-buffer)
(bind-key "H-x" 'eval-last-sexp)


(bind-key "<f1>" 'kill-current-buffer)
(bind-key "<f2>" 'save-buffer)
(bind-key "<f3>" 'replace-string)
(bind-key "M-<f3>" 'my-replace-under-point)

(bind-key "<f4>" 'my-delete-whole-line)

;; (bind-key "<f5>" ')
;; (bind-key "<f6>" ')
;; (bind-key "<f7>" ')
;; (bind-key "<f8>" ')
;; (bind-key "<f9>" ')
;; (bind-key "<f10>" ')
;; (bind-key "<f11>" ') ; Toggle fullscreen

(bind-key "<f12>" 'kmacro-end-or-call-macro)
(bind-key "C-<f12>" 'kmacro-start-macro-or-insert-counter)

(bind-key "s-<SPC>" 'my-switch-language)
(bind-key "C-z" 'undo)


(bind-key "C-x <left>" 'previous-buffer)
(bind-key "C-<left>" 'previous-buffer)
(bind-key "<mouse-8>" 'previous-buffer)

(bind-key "C-x <right>" 'next-buffer)
(bind-key "C-<right>" 'next-buffer)
(bind-key "<mouse-9>" 'next-buffer)


;;; 
;;; 04macrofunc.el ends here
