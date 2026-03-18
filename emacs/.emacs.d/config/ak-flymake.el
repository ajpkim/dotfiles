(provide 'ak-base)

(use-package flymake
  :bind (:map flymake-mode-map
              ("M-g n" . flymake-goto-next-error)
              ("M-g p" . flymake-goto-prev-error)))
