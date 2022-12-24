(require `package)
(setq package-enable-at-startup nil)
(add-to-list `package-archives
	     `("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p `use-package)
  (package-refresh-contents)
  (package-install `use-package))

;;; --------------------------
;;; Everything above must stay in init file and not config.org file
;;; --------------------------

;; SETTING UP ORG CONFIG
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;;; --------------------------
;;; Everything below must stay in init file and not config.org file
;;; --------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9f1d0627e756e58e0263fe3f00b16d8f7b2aca0882faacdc20ddd56a95acb7c2" "6dc02f2784b4a49dd5a0e0fd9910ffd28bb03cfebb127a64f9c575d8e3651440" "e1ad4299390cb3fc0cbf5a705442eaf08510aa947c90c8bc83b1d7308befb475" "0568a5426239e65aab5e7c48fa1abde81130a87ddf7f942613bf5e13bf79686b" "abe5ee8858cd1fbe36304a8c3b2315d3e0a4ef7c8588fcc45d1c23eafb725bb6" "bde7af9e749d26cbcbc3e3ac2ac9b13d52aa69b6148a8d6e5117f112f2797b42" "465f04ecb7486d45ed9e186588e16b0b2e7a8fc04d7d355d0ba9c0c4ea3fb6de" "30b14930bec4ada72f48417158155bc38dd35451e0f75b900febd355cda75c3e" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "aa85228e4b6d188c3c0b8553548142c2c75726429614376c26255a51378982f5" "81c3de64d684e23455236abde277cda4b66509ef2c28f66e059aa925b8b12534" "d0aa1464d7e55d18ca1e0381627fac40229b9a24bca2a3c1db8446482ce8185e" "e208e45345b91e391fa66ce028e2b30a6aa82a37da8aa988c3f3c011a15baa22" "d600c677f1777c1e4bfb066529b5b73c0179d0499dd4ffa3f599a0fb0cfbd501" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "2dff5f0b44a9e6c8644b2159414af72261e38686072e063aa66ee98a2faecf0e" default))
 '(display-time-mode t)
 '(fci-rule-color "#383838")
 '(fringe-mode 10 nil (fringe))
 '(global-hl-line-mode nil)
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(line-number-mode nil)
 '(linum-format " %6d ")
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(my-modus-themes-tinted t)
 '(my/modus-themes-tinted t)
 '(org-agenda-custom-commands
   '(("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("v" "Active tasks" alltodo "ACTIVE" nil)))
 '(org-agenda-files
   '("/home/ajpkim/org/projects.org" "/home/ajpkim/org/todo.org" "/home/ajpkim/org/anki.org" "/home/ajpkim/org/passtur.org" "/home/ajpkim/org/journal/2022-12-21.org"))
 '(package-selected-packages
   '(auctex lsp-tailwindcss 0blayout npm-mode tide editorconfig emmet-mode prettier-js lsp-ui web-mode json-mode expand-region tree-sitter-langs tree-sitter typescript-mode yaml-mode dockerfile-mode ivy-posframe ivy-postframe org-roam-ui simple-modeline doom-modeline helpful ivy-rich auto-package-update projectile citar citeproc csv-mode erc-image erc-hl-nicks rainbow-delimiters ob-go go-mode simple-httpd ox-hugo lsp-ivy csharp-mode lsp-mode org-mime pass pinentry org-pomodoro magit elfeed ein company-quickhelp company-anaconda anaconda-mode company geiser-mit geiser pastelmac-theme clues-theme afternoon-theme sicp anki-editor multiple-cursors counsel ivy smartparens olivetti modus-themes org-journal org-roam toc-org htmlize org-drill drag-stuff ace-window rainbow-mode avy org-bullets beacon dracula-theme which-key use-package))
 '(pos-tip-background-color "#414E63")
 '(pos-tip-foreground-color "#BEC8DB")
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(smtpmail-smtp-server "127.0.0.1")
 '(smtpmail-smtp-service 1025))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:height 0.65))))
 '(mode-line-inactive ((t (:height 0.95))))
 '(variable-pitch ((t (:family "Ubuntu")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
