;;; ak-javascript-typescript.el --- JavaScript and TypeScript configuration -*- lexical-binding: t -*-
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

;; Use project-local node_modules/.bin (eslint, prettier, tsc, ...)
;; instead of anything installed globally. Hooked at depth -90 so it
;; always runs before prettier-js/flymake-eslint below, regardless of
;; use-package load order (add-hook otherwise prepends, so whichever
;; :hook form runs last would run first).
(use-package add-node-modules-path
  :ensure t
  :config
  ;; Default command is "npm bin", which npm 9+ removed
  ;; ("Unknown command: bin"). "npm root" still works and resolves
  ;; the same node_modules directory; stderr is redirected since npm
  ;; prints registry config warnings there that would otherwise
  ;; corrupt the captured path.
  (setq add-node-modules-path-command '("echo $(npm root 2>/dev/null)/.bin"))
  (dolist (hook '(js-ts-mode-hook typescript-ts-mode-hook))
    (add-hook hook #'add-node-modules-path -90)))

;; Prettier for formatting. No prettier-js-args: defer entirely to
;; the project's own .prettierrc.
(use-package prettier-js
  :ensure t
  :hook ((js-ts-mode . prettier-js-mode)
         (typescript-ts-mode . prettier-js-mode)))

;; ESLint diagnostics from the project's own .eslintrc.
(use-package flymake-eslint
  :ensure t
  :hook ((js-ts-mode . flymake-eslint-enable)
         (typescript-ts-mode . flymake-eslint-enable)))
