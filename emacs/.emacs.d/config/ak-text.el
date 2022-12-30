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

;; (define-key mc/keymap (kbd "<return>") nil))
					; allows us to insert new-line with <RET> and still disable multiple-cursor mode with C-g
