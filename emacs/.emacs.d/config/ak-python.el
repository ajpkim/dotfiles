(provide 'ak-python)

(use-package python-ts-mode
  :hook
  ((python-ts-mode . eglot-ensure)
   (python-ts-mode . blacken-mode)
   (python-ts-mode . (lambda () (setq tab-width 4))))
  ;; :bind (:map python-ts-mode-map
  ;; 	      ("<f5>" . recompile))
  :mode (("\\.py\\'" . python-ts-mode)))

;; Jupyter notebooks
(use-package ein
  :ensure t)

(use-package blacken
  :ensure t)
