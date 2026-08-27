;;; ak-gpg.el --- GPG configuration -*- lexical-binding: t -*-
(provide 'ak-gpg)

(use-package pinentry
  :ensure t
  :config
  (setf epa-pinentry-mode 'loopback)
  (pinentry-start))

(use-package pass
  :ensure t
  :config
  (setf epa-pinentry-mode 'loopback))
