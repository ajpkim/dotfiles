(provide 'ak-python)

(use-package python-ts-mode
  :hook
  ((python-ts-mode . eglot-ensure)
   (python-ts-mode . blacken-mode)
   (python-ts-mode . (lambda () (setq tab-width 4))))
  :mode (("\\.py\\'" . python-ts-mode)))

;; Jupyter notebooks
(use-package ein
  :ensure t)

;; Formatter
(use-package blacken
  :ensure t
  :config
  (setq blacken-line-length 105)
)
