;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript and Typescript configuration.
;; Supports React jsx and tsx files.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-js-ts)

(setq js-indent-level 2)
(setq typescript-indent-level 2)


(use-package typescript-ts-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-ts-mode)))

;; (use-package js-ts-mode
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-ts-mode)))




;; Formatting with prettier
;; (add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'js-ts-mode-hook 'prettier-js-mode)
;; (add-hook 'tsx-ts-mode-hook 'prettier-js-mode)
;; (add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'typescript-ts-mode-hook 'prettier-js-mode)
