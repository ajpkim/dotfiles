(provide 'ak-mail)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mu4e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'mu4e)

(use-package mu4e
  :ensure nil  ;; Installed via pacman
  ;; :load-path "/usr/share/emacs/site-lisp/mu4e/"
  :config
  (require 'mu4e-org)
  (setq mu4e-maildir "~/mail"
        mu4e-get-mail-command "mbsync -a"
        mu4e-change-filenames-when-moving t  ;; important
        update-interval (* 10 60)
        mu4e-compose-format-flowed t
        message-kill-buffer-on-exit t
        mu4e-compose-dont-reply-to-self t
        mu4e-confirm-quit nil
        mu4e-view-show-images t
        ;; mu4e-context-policy 'pick-first
        mu4e-attachment-dir "~/Downloads"

        ;; user-mail-address "alex@ajpkim.com"
        user-full-name "Alex Kim"
        send-mail-function 'smtpmail-send-it
        smtpmail-default-smtp-server "smtp.fastmail.com"
        smtpmail-smtp-server "smtp.fastmail.com"
        smtpmail-smtp-service 465
        smtpmail-stream-type  'ssl

        mu4e-drafts-folder "/Drafts"
        mu4e-refile-folder "/Archive"
        mu4e-sent-folder "/Sent"
        mu4e-trash-folder "/Trash"

        mu4e-maildir-shortcuts
        '(("/Inbox" . ?i)
          ("/Sent" . ?s)
          ("/accounts" . ?a)
          ("/Drafts" . ?d)
          ("/fin" . ?f)
          ("/travel" . ?t)
          ("/health" . ?h)
          ("/orgs" . ?o)
          ("/me" . ?m)))
  :bind
  ("C-x m" . mu4e)
  ("C-x M" . mu4e-compose-new))
;; Convenient capture in mu4e ("a" brings up quick action menu in mu4e)
(defun my-capture-mail (msg)
  (interactive)
  (org-capture nil "e"))

(add-to-list 'mu4e-headers-actions
             '("org capture mail" . my-capture-mail) t)
(add-to-list 'mu4e-view-actions
             '("org capture email" . my-capture-mail) t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mime
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-mime
    :ensure t)
