(provide 'ak-visual)

(setq inhibit-startup-message t)
(setq visible-bell t)

(blink-cursor-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 220)

;; (use-package beacon
;;   :ensure t
;;   :init
;;   (beacon-mode 1))

;; (use-package rainbow-mode
;;   :ensure t
;;   :init
;;   (rainbow-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
