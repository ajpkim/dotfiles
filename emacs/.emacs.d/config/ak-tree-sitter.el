;; TODO: Update when Emacs 29 lands.

(provide 'ak-tree-sitter)

(use-package tree-sitter
  :ensure t
  :init
  (global-tree-sitter-mode)
  )

(use-package tree-sitter-langs
  :ensure t)

;; These are the currently supported ts modes (2023-01)
(add-hook 'css-mode-hook #'tree-sitter-hl-mode)
(add-hook 'html-mode-hook #'tree-sitter-hl-mode)
(add-hook 'js-mode-hook #'tree-sitter-hl-mode)
(add-hook 'json-mode-hook #'tree-sitter-hl-mode)
(add-hook 'python-mode-hook #'tree-sitter-hl-mode)
(add-hook 'sh-mode-hook #'tree-sitter-hl-mode)
(add-hook 'typescript-mode-hook #'tree-sitter-hl-mode)
(add-hook 'yaml-mode-hook #'tree-sitter-hl-mode)
