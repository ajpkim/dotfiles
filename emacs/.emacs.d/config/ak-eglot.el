;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP with eglot
;;
;; Language servers installed:
;; Python: pyright
;; Bash: bash-language-server
;; JS: typescript-language-server
;; Typescript: typescript-language-server
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-eglot)

(use-package eglot
  :ensure t)

(add-hook 'prog-mode-hook 'eglot-ensure)
