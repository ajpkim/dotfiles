;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programming configuration which includes editorconfig and general settings.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-prog)

(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode 1)
            (hs-minor-mode 1)))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))
