;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IRC with Erc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-erc)

(setq erc-server "irc.libera.chat"
      erc-nick "ajpkim"
      erc-user-full-name "Alex Kim"
      erc-kill-buffer-on-part t
      erc-fill-column 100  ;; can always override via Olivetti

      erc-fill-function 'erc-fill-static
      erc-fill-static-center 15

      erc-hide-list '("JOIN" "PART" "QUIT" "MODE" "AWAY")
      ;; erc-track-exclude  ;; turn off notifications for specific channels
      erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "AWAY")
      erc-track-visibility nil
      ;; erc-keywords  ;; will highlight keywords in chats
      )

;; Uniquely color different nicks in chat
(use-package erc-hl-nicks
  :ensure t
  :after erc
  :config
  (add-to-list 'erc-modules 'hl-nicks))

(use-package erc-image
  :ensure t
  :after erc
  :config
  (setq erc-image-inline-rescale 200)
  (add-to-list 'erc-modules 'image))
