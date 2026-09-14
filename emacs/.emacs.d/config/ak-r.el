;;; ak-r.el --- R configuration (ESS) -*- lexical-binding: t -*-
(provide 'ak-r)

(use-package ess
  :ensure t
  :init
  (require 'ess-site)
  :config
  (setq ess-style 'RStudio)
  :bind (:map ess-r-mode-map
              ("M--" . ess-insert-assign)))
