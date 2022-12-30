;; Shared programming configuration

(provide 'ak-prog)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Will format code according to editorconfig when present
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))
