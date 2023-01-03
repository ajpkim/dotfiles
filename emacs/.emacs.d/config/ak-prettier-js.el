;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Code formatting with PrettierJS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-prettier-js)

;; Cannot set the hooks in use-package declaration here for some reason...
(use-package prettier-js
  :ensure t)

(add-hook 'tsx-ts-mode-hook 'prettier-js-mode)
(add-hook 'typescript-ts-mode-hook 'prettier-js-mode)

(setq prettier-js-args '("--trailing-comma" "all"
			 "--bracket-spacing" "true"
			 "--semi" "false"
			 "--singleQuote" "true"
			 ))
