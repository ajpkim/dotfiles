;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript and Typescript configuration.
;; Supports React jsx and tsx files.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-js-ts)

;; Formatting with prettier
(add-hook 'js-ts-mode-hook 'prettier-js-mode)
(add-hook 'typescript-ts-mode-hook 'prettier-js-mode)
