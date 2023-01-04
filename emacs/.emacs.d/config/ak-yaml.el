(provide 'ak-yaml)

(use-package yaml-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; Mirror python-mode newline and indent behavior
(add-hook 'yaml-mode-hook
	  (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
