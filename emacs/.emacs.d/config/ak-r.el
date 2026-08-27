;;; ak-r.el --- R configuration (ESS) -*- lexical-binding: t -*-
(provide 'ak-r)

(use-package ess
  :ensure t)

(define-key ess-mode-map (kbd "M--") "<-")
