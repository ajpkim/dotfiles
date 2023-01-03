(provide 'ak-latex)

(use-package auctex
    :ensure t
    :defer t
    :hook (LaTeX-mode . display-line-numbers-mode))
