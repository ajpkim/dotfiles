(provide 'ak-olivetti)

(use-package olivetti
  :ensure t
  :config
  (setq-default olivetti-body-width 80)
  :bind
  ("C-c o" . olivetti-mode)
  ("C-c h o" . olivetti-set-width))
