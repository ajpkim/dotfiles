;;; ak-projectile.el --- Projectile configuration -*- lexical-binding: t -*-
(provide 'ak-projectile)

(use-package projectile
  :ensure t
  :config
  (setq projectile-completion-system 'ivy
	projectile-mode t))

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
