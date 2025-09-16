;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom text insertion and manipulation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-text)

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
;; string-inflection for converting cases
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package string-inflection
  :ensure t
  :bind (("C-c i t" . string-inflection-cycle)
         ("C-c i s" . string-inflection-underscore)   ;; snake_case
         ("C-c i k" . string-inflection-kebab-case)   ;; kebab-case
         ("C-c i c" . string-inflection-camelcase)    ;; lowerCamelCase
         ("C-c i p" . string-inflection-pascal-case)  ;; UpperCamelCase
         ("C-c i u" . string-inflection-upcase)       ;; SCREAMING_SNAKE
         ("C-c i l" . string-inflection-downcase)))   ;; lowercase


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Quick text insertions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(global-set-key (kbd "C-M-;") 'copy-and-comment-region)
(global-set-key (kbd "C-c h ?") 'insert-inverted-question-mark)
(global-set-key (kbd "C-c h R") 'insert-right-arrow)
(global-set-key (kbd "C-c h a") 'insert-dots-glyph)
(global-set-key (kbd "C-c h l") 'insert-latex-delims)
(global-set-key (kbd "C-c h n") 'display-line-numbers-mode)
(global-set-key (kbd "C-c h r") 'replace-string)
(global-set-key (kbd "C-c h v") 'variable-pitch-mode)
(global-set-key (kbd "C-c h y") 'yank-from-kill-ring)
