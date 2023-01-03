(provide 'ak-prettier-js)

(use-package prettier-js
  :ensure t
  :hook
  (typescript-ts-mode-hook . prettier-js-mode)
  (tsx-ts-mode-hook . prettier-js-mode)
  )

;; (add-hook 'typescript-ts-mode-hook #'(lambda ()
;; 				       (enable-minor-mode
;; 					'("\\.jsx?\\'" . prettier-js-mode))
;; 				       (enable-minor-mode
;; 					'("\\.tsx?\\'" . prettier-js-mode))))

;; (add-hook 'tsx-ts-mode-hook #'(lambda ()
;; 				       (enable-minor-mode
;; 					'("\\.jsx?\\'" . prettier-js-mode))
;; 				       (enable-minor-mode
;; 					'("\\.tsx?\\'" . prettier-js-mode))))
