;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript and Typescript configuration.
;; Supports React jsx and tsx files.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-javascript-typescript)

(setq-default js-indent-level 2
              typescript-indent-level 2)

(use-package typescript-ts-mode
  :mode ("\\.ts\\'" "\\.tsx\\'"))

(use-package js-ts-mode
  :mode ("\\.js\\'" "\\.jsx\\'"))

;; Prettier for Formatting
(use-package prettier-js
  :ensure t
  :hook ((js-ts-mode . prettier-js-mode)
         (typescript-ts-mode . prettier-js-mode))
  :config
  (setq prettier-js-args
        '("--trailing-comma" "all"
          "--bracket-spacing" "true"
          "--semi" "false"
          "--single-quote" "true"
          "--print-width" "110")))
