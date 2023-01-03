(provide 'ak-company)

(use-package company
  :ensure t
  :config
    (setq company-idle-delay 0
          company-show-numbers t
          company-minimum-prefix-length 1
          company-selection-wrap-around t)
    :init
    (add-hook 'prog-mode-hook 'company-mode))
