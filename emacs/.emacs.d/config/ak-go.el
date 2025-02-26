(provide 'ak-go)

(use-package go-mode
  :ensure t
  :hook ((go-mode . (lambda ()
                      ;; Display tabs as 4 spaces wide.
                      (setq tab-width 4)
                      ;; Use actual tab characters.
                      (setq indent-tabs-mode t)
                      ;; Auto-format with gofmt before saving.
                      (add-hook 'before-save-hook 'gofmt-before-save nil t)
                      ;; Start LSP with eglot.
                      (eglot-ensure)))))
