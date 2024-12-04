(provide 'ak-yaml)

(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" . yaml-mode)
  :hook ((yaml-mode . (lambda ()
                        (define-key yaml-mode-map (kbd "RET") 'newline-and-indent)))))
