(provide 'ak-web-dev)

;; (use-package typescript-mode
;;   :ensure t
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
;;   (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode)))

;; (use-package prettier-js
;;   :ensure t
;;   :config
;;   :hook
;;   ((js-mode . prettier-js-mode)
;;    (typescript-mode . prettier-js-mode)))



;; (use-package typescript-ts-mode
;;   :ensure t
;;   :mode (("\\.js\\'" . typescript-ts-mode)
;; 	 ("\\.jsx\\'" .  typescript-ts-mode)
;; 	 ("\\.ts\\'" . typescript-ts-mode)
;; 	 ("\\.tsx\\'" . typescript-ts-mode)
;; 	 ;; ("\\.html\\'" . web-mode))
;; 	 )
;;   )

;; (add-to-list 'eglot-server-programs '(typescript-ts-mode . ("typescript-language-server" "--stdio")))





;; (use-package web-mode
;;   :ensure t
;;   :mode (("\\.js\\'" . web-mode)
;; 	 ("\\.jsx\\'" .  web-mode)
;; 	 ("\\.ts\\'" . web-mode)
;; 	 ("\\.tsx\\'" . web-mode)
;; 	 ;; ("\\.html\\'" . web-mode))
;; 	 )
;;   :config
;;   :commands web-mode)

;; ;; (add-to-list 'eglot-server-programs '(web-mode . ("typescript-language-server" "--stdio")))

;; (defun enable-minor-mode (my-pair)
;;   "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
;;   (if (buffer-file-name)
;;       (if (string-match (car my-pair) buffer-file-name)
;; 	  (funcall (cdr my-pair)))))

;; (use-package prettier-js
;;   :ensure t)

;; (add-hook 'web-mode-hook #'(lambda ()
;;                              (enable-minor-mode
;;                               '("\\.jsx?\\'" . prettier-js-mode))
;; 			     (enable-minor-mode
;;                               '("\\.tsx?\\'" . prettier-js-mode))))
