(provide 'ak-csv)


(use-package csv-mode
  :ensure t
  :hook (csv-mode . csv-align-mode))
