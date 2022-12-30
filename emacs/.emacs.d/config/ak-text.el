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


(use-package drag-stuff
  :ensure t
  :config
  (progn
    (drag-stuff-global-mode t)
    (drag-stuff-define-keys))
  :bind
  (("M-p" . drag-stuff-up)
   ("M-n" . drag-stuff-down)))
