;;; ak-go.el --- Go configuration -*- lexical-binding: t -*-
(provide 'ak-go)

(use-package go-mode
  :ensure t
  :hook ((go-ts-mode . (lambda ()
                      ;; Display tabs as 4 spaces wide.
                      (setq tab-width 4)
                      ;; Use actual tab characters.
                      (setq indent-tabs-mode t)
                      ;; electric-indent-mode's RET handling can spuriously
                      ;; reindent the previous line under go-ts-mode; bypass
                      ;; it and just indent the new line directly.
                      (electric-indent-local-mode -1)
                      (local-set-key (kbd "RET") #'newline-and-indent)
                      (add-hook 'before-save-hook 'gofmt nil t)))))
