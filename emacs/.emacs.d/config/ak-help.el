(provide 'ak-help)

(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

;; (use-package helpful
;;   :ensure t
;;   :custom
;;   (counsel-describe-function-function #'helpful-callable)
;;   (counsel-describe-variable-function #'helpful-variable)
;;   :bind
;;   ;; counsel commands are preferred over base helpful commands bc of baked in ivy power of counsel
;;   (([remap describe-function] . counsel-describe-function)
;;    ([remap describe-command] . helpful-command)
;;    ([remap describe-variable] . counsel-describe-variable)
;;    ([remap describe-key] . helpful-key)))
