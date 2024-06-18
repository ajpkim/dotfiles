;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Code formatting with PrettierJS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-prettier-js)

(use-package prettier-js
  :ensure t)

(setq prettier-js-args '("--trailing-comma" "all"
			 "--bracket-spacing" "true"
			 "--semi" "false"
			 "--singleQuote" "true"
			 "--print-width" "110"
			 ))
