;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript and Typescript configuration.
;; Supports React jsx and tsx files.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-js-ts)

;; ;; https://notes.alexkehayias.com/setting-up-typescript-and-eslint-with-eglot/
;; ;; I'm not sure why this is needed, but it throws an error if I remove it
;; (cl-defmethod project-root ((project (head eglot-project)))
;;   (cdr project))

;; (defun my-project-try-tsconfig-json (dir)
;;   (when-let* ((found (locate-dominating-file dir "tsconfig.json")))
;;     (cons 'eglot-project found)))

;; (add-hook 'project-find-functions
;;           'my-project-try-tsconfig-json nil nil)

;; (add-to-list 'eglot-server-programs
;;              '((typescript-mode) "typescript-language-server" "--stdio"))




;; ;; https://github.com/orzechowskid/tsi.el/
;; ;; great tree-sitter-based indentation for typescript/tsx, css, json
;; (use-package tsi
;;   :after tree-sitter
;;   :quelpa (tsi :fetcher github :repo "orzechowskid/tsi.el")
;;   ;; define autoload definitions which when actually invoked will cause package to be loaded
;;   :commands (tsi-typescript-mode tsi-json-mode tsi-css-mode)
;;   :init
;;   (add-hook 'typescript-mode-hook (lambda () (tsi-typescript-mode 1)))
;;   (add-hook 'json-mode-hook (lambda () (tsi-json-mode 1)))
;;   (add-hook 'css-mode-hook (lambda () (tsi-css-mode 1)))
;;   (add-hook 'scss-mode-hook (lambda () (tsi-scss-mode 1))))




;; (use-package typescript-mode
;;   :ensure t
;;   :after tree-sitter
;;   :config
;;   ;; we choose this instead of tsx-mode so that eglot can automatically figure out language for server
;;   ;; see https://github.com/joaotavora/eglot/issues/624 and https://github.com/joaotavora/eglot#handling-quirky-servers
;;   (define-derived-mode typescriptreact-mode typescript-mode
;;     "TypeScript TSX")

;;   ;; use our derived mode for tsx files
;;   (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescriptreact-mode))
;;   ;; by default, typescript-mode is mapped to the treesitter typescript parser
;;   ;; use our derived mode to map both .tsx AND .ts -> typescriptreact-mode -> treesitter tsx
;;   (add-to-list 'tree-sitter-major-mode-language-alist '(typescriptreact-mode . tsx)))




;; (use-package typescript-mode
;;   :mode (("\\.js\\'" . typescript-mode)
;; 	 ("\\.jsx\\'" .  typescript-mode)
;; 	 ("\\.ts\\'" . typescript-mode)
;; 	 ("\\.tsx\\'" . typescript-mode)
;; 	 ))
