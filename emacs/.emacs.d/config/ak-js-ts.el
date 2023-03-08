;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript and Typescript configuration.
;; Supports React jsx and tsx files.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-js-ts)

;; Formatting with prettier
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'js-ts-mode-hook 'prettier-js-mode)
(add-hook 'tsx-ts-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'typescript-ts-mode-hook 'prettier-js-mode)
