(provide 'ak-python)

(use-package python-ts-mode
  :hook
  (python-mode-hook . python-ts-mode)
  (python-mode-hook . (lambda () (setq tab-width 4))))

;; Jupyter notebooks
(use-package ein
  :ensure t)

(use-package blacken
  :ensure t)

(add-hook 'python-mode-hook 'blacken-mode)
