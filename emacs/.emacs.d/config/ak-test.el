(provide 'ak-test)

;; (use-package debbugs
;;   :ensure t)

(use-package treemacs
  :ensure t)

(use-package centaur-tabs
  :ensure t)



;; (use-package ts-fold
;;   :straight (ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold"))


(use-package highlight-indent-guides
  :ensure t
  :config
  (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
  (setq highlight-indent-guides-method 'character))
