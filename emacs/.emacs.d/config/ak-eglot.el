;;; ak-eglot.el --- Eglot (LSP) -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Eglot (LSP)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-eglot)

(use-package eglot
  :ensure t
  :hook ((python-mode        . eglot-ensure)
         (python-ts-mode     . eglot-ensure)
         (go-ts-mode          . eglot-ensure)
         (js-ts-mode          . eglot-ensure)
         (typescript-ts-mode  . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode) . ("pyright-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(go-ts-mode . ("gopls")))
  (add-to-list 'eglot-server-programs
               '((js-ts-mode typescript-ts-mode) . ("typescript-language-server" "--stdio"))))
