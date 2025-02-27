;;; 05macrofunc.el --- keyboard macroses and custom functions
;;;
;;; Time-stamp: <2024-10-08 20:43:32 azabiralov>
;;;
;;; Commentary:

;;; Code:


;; Insert comment and horizontal line of 77 '-' characters
(fset 'macro-insert-commented-line
      [?\M-\; ?\C-u ?7 ?7 ?- return])


;; Switch to new line and insert comment
(fset 'macro-return-then-insert-comment
      "\C-m\C-[;")


;; Fill by width
(fset 'macro-fill-by-width
      "\C-u\C-[q")


;; Recrate destroyed scratch buffer
(defun my-recreate-scratch nil
  "Recreate a scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))


;; Insert 'version' date
(defun my-insert-version ()
  "Insert date as version at point."
  (interactive)
  (insert (shell-command-to-string "date +%y.%j | tr -d \\n")))


;; Switch input language
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


(defun my-switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer-other-window (other-buffer (current-buffer) 1)))


(defun my-forward-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument ARG, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))


(defun my-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (my-delete-word (- arg)))


(defun my-forward-delete-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (delete-region
   (point)
   (progn (end-of-line 1) (point)))
  (delete-char 1))


(defun my-backward-delete-line ()
  "Delete text between the beginning of the line to the cursor position.
This command does not push text to `kill-ring'."
  (interactive)
  (let (p1 p2)
    (setq p1 (point))
    (beginning-of-line 1)
    (setq p2 (point))
    (delete-region p1 p2)))


(defun my-whack-whitespace (arg)
  "Delete all white space from point to the next word.
With prefix ARG delete across newlines as well."
  (interactive "P")
  (let ((regexp (if arg "[ \t\n]+" "[ \t]+")))
    (re-search-forward regexp nil t)
    (replace-match "" nil nil)))


(defun my-rename-file-and-buffer (arg)
  "Renames both current buffer and file it's visiting to ARG."
  (interactive "sNew file and buffer name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer arg)
          (message "A buffer named '%s' already exists!" arg)
        (progn
          (rename-file filename arg 1)
          (rename-buffer arg)
          (set-visited-file-name arg)
          (set-buffer-modified-p nil))))))


(defun my-switch-to-scratch-and-kill-all-buffers ()
  "Kill all buffers and delete all other windows."
  (interactive)
  (if (yes-or-no-p "Switch to *scratch* and kill all other buffers and windows? ")
      ((other-window)
       (switch-to-buffer "*scratch*")
       (mapcar 'kill-buffer (buffer-list))
       (delete-other-windows))
    (message "Abort.")))


(defun my-sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

(bind-key "C-k" 'kill-whole-line)

(bind-key "<f1>" 'kill-buffer-and-window)

(bind-key "C-x K" 'my-switch-to-scratch-and-kill-all-buffers)


(bind-key "M-<tab>" 'other-window)

(bind-key "<backtab>" 'other-window)

(bind-key "<f2>" 'save-buffer)
(bind-key "M-<f2>" 'my-rename-file-and-buffer)

(bind-key "<f3>" 'replace-string)
(bind-key "M-<f3>" 'my-replace-under-point)

(bind-key "<f5>" 'move-dup-duplicate-down)
(bind-key "S-<f5>" 'move-dup-duplicate-up)

(bind-key "<f6>" 'duplicate-line)

(bind-key "<f7>" 'kill-this-buffer)

(bind-key "<f9>" 'mark-whole-buffer)


(bind-key "C-<up>" 'windmove-up)
(bind-key "C-<down>" 'windmove-down)

(bind-key "s-<SPC>" 'my-switch-language)
(bind-key "C-z" 'undo)
(bind-key "C-=" 'my-whack-whitespace)

(bind-key "C-x <left>" 'previous-buffer)
(bind-key "C-x <right>" 'next-buffer)
(bind-key "C-<left>" 'previous-buffer)
(bind-key "C-<right>" 'next-buffer)
(bind-key "<mouse-8>" 'previous-buffer)
(bind-key "<mouse-9>" 'next-buffer)

(bind-key "<left-fringe> <mouse-4>" 'previous-error)
(bind-key "<left-margin> <mouse-4>" 'previous-error)
(bind-key "<left-fringe> <mouse-5>" 'next-error)
(bind-key "<left-margin> <mouse-5>" 'next-error)

(bind-key "<vertical-line> <mouse-4>" 'window-swap-states)
(bind-key "<vertical-line> <mouse-5>" 'window-swap-states)

(bind-key "C-<backspace>" 'my-backward-delete-line)
(bind-key "C-<delete>" 'my-forward-delete-line)

(bind-key "M-<backspace>" 'my-backward-delete-word)
(bind-key "M-<delete>" 'my-forward-delete-word)
(bind-key "M-d" 'my-forward-delete-word)

(bind-key "C-<f12>" 'kmacro-start-macro-or-insert-counter)
(bind-key "<f12>" 'kmacro-end-or-call-macro)



;;; 
;;; 04macrofunc.el ends here
