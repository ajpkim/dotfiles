;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Eglot (LSP)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-eglot)

;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp")))
;;   ;; (add-to-list 'eglot-server-programs '(js-ts-mode . ("typescript-language-server" "--stdio")))
;;   ;; (add-to-list 'eglot-server-programs '(tsx-ts-mode . ("typescript-language-server" "--stdio")))
;;   (add-to-list 'eglot-server-programs '(typescript-ts-mode . ("typescript-language-server" "--stdio")))

;;   (setq-default eglot-workspace-configuration
;;                 '((:pylsp . (:configurationSources ["flake8"] :plugins (:pycodestyle (:enabled nil) :mccabe (:enabled nil) :flake8 (:enabled t))))))

;;   :hook
;;   (prog-mode-hook . eglot-ensure)
;;   )

;; (add-hook 'prog-mode-hook #'eglot-ensure)
