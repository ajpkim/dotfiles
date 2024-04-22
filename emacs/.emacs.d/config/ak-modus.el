(provide 'ak-modus)

(use-package emacs
  :ensure t
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil)
  :config
  ;; Load the theme of your choice.
  (load-theme 'modus-operandi t t)
  (load-theme 'modus-vivendi t t)
  (load-theme 'modus-operandi-tritanopia t t)
  (load-theme 'modus-vivendi-tritanopia t t)
  :bind ("<f5>" . modus-themes-toggle))



(enable-theme 'modus-vivendi-tritanopia)
