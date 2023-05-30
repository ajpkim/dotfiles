;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Eglot (LSP)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-eglot)

;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-to-list 'eglot-server-programs '(sh-ts-mode . ("bash-language-server" "--stdio")))
;;   (add-to-list 'eglot-server-programs '(python-ts-mode . ("python-language-server" "--stdio")))
;;   (add-to-list 'eglot-server-programs '(tsx-ts-mode . ("typescript-language-server" "--stdio")))
;;   (add-to-list 'eglot-server-programs '(typescript-ts-mode . ("typescript-language-server" "--stdio")))
;;   :hook
;;   (python-mode-hook . eglot-ensure)
;;   (python-ts-mode-hook . eglot-ensure)
;;   (sh-mode-hook . eglot-ensure)
;;   (js-mode-hook . eglot-ensure)
;;   (tsx-ts-mode . eglot-ensure)
;;   (typescript-ts-mode-hook . eglot-ensure)
;;   )


(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp")))
  (add-to-list 'eglot-server-programs '(js-ts-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(tsx-ts-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(typescript-ts-mode . ("typescript-language-server" "--stdio")))


   (setq-default eglot-workspace-configuration
                '((:pylsp . (:configurationSources ["flake8"] :plugins (:pycodestyle (:enabled nil) :mccabe (:enabled nil) :flake8 (:enabled t))))))

  :hook
  (prog-mode-hook . eglot-ensure)
  ;; (python-ts-mode-hook . eglot-ensure)
  )

;; (add-hook 'prog-mode-hook #'eglot-ensure)
