;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic text navigation and manipulation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-text)

(setq scroll-conservatively 0)
(setq scroll-preserve-screen-position t)
(setq select-enable-clipboard t)
(setq select-enable-primary t)

(delete-selection-mode 1)

;; Region selection
(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)
         ("C--" . er/contract-region)))

;; Character selection
(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

;; Manipulate lines of text
(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode t)
n  (drag-stuff-define-keys)
  :bind (("M-p" . drag-stuff-up)
	 ("M-n" . drag-stuff-down)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-c m e" . mc/edit-lines)
	 ("C-c m n" . mc/mark-next-like-this)
	 ("C-c m b" . mc/mark-previous-like-this)
	 ("C-c m a" . mc/mark-all-like-this)
	 ("C-c m a" . mc/mark-all-like-this)
	 ("C-c m r" . mc/mark-all-in-region)
	 ("C-c m R" . mc/mark-all-in-region-regexp)))

;; Allows us to insert new-line with <RET> and still disable multiple-cursor mode with C-g
;; (define-key mc/keymap (kbd "<return>") nil)

(defun copy-and-comment-region (beg end &optional arg)
  "Copy region as kill and comment-out the copied text.
  See `comment-region' for behavior of a prefix arg."
  (interactive "r\nP")
  (copy-region-as-kill beg end)
  (goto-char end)
  (comment-or-uncomment-region beg end arg))

(defun sort-words (reverse beg end)
  "From https://www.emacswiki.org/emacs/SortWords
  Sort words in region alphabetically, in REVERSE if negative.
      Prefixed with negative \\[universal-argument], sorts in reverse.

p      The variable `sort-fold-case' determines whether alphabetic case
      affects the sort order.

      See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Quick text insertions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-insert)

(defun insert-raquo ()
  (interactive)
  (insert "» "))

(defun insert-dots-glyph ()
  "Use this to signal my personal voice when notetaking etc."
  (interactive)
  (insert "܀ "))

(defun insert-right-arrow ()
  (interactive)
  (insert "→ "))

(defun insert-latex-delims (arg)
  (interactive "P")
  (if arg
      (insert "\\[\\]")
    (insert "\\(\\)"))
  (backward-char)
  (backward-char))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c h ;") 'copy-and-comment-region)
(global-set-key (kbd "C-c h ?") 'insert-inverted-question-mark)
(global-set-key (kbd "C-c h R") 'insert-right-arrow)
(global-set-key (kbd "C-c h a") 'insert-dots-glyph)
(global-set-key (kbd "C-c h l") 'insert-latex-delims)
(global-set-key (kbd "C-c h n") 'display-line-numbers-mode)
(global-set-key (kbd "C-c h r") 'replace-string)
(global-set-key (kbd "C-c h v") 'variable-pitch-mode)
(global-set-key (kbd "C-c h y") 'yank-from-kill-ring)
