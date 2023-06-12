(provide 'ak-base)

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;; Always revert (reload) buffers on file change
(global-auto-revert-mode t)

;; Store all emacs backup files in ~/.emacs-backups
(setq backup-directory-alist
      `((".*" . "~/.emacs-backups/")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-backups/" t)))

;; Make cursor follow to new windows
(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") `split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") `split-and-follow-vertically)

;; Fast window selection
(use-package ace-window
  :ensure t
  :config (setq aw-keys `(?a ?s ?d ?f ?j ?k ?l))
  :bind ("C-x o" . ace-window))

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-t") 'shell)

;; Allow Emacs to access content from clipboard.
(setq select-enable-clipboard t
      select-enable-primary t)

(electric-pair-mode 1)
