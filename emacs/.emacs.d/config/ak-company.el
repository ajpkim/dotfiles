(provide 'ak-company)

(use-package company
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'company-mode)
  :config
  (setq company-idle-delay 0.1
        company-show-numbers t
        company-minimum-prefix-length 1
        company-selection-wrap-around t)
  (add-hook 'after-init-hook
            (lambda ()
              (setq-local company-backends '(company-capf)))))
