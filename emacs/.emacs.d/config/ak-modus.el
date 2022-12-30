(provide 'ak-modus)

(use-package modus-themes
  :ensure t
  :init
  (setq modus-themes-slanted-constructs t
        modus-themes-bold-constructs nil)
        ;; modus-themes-region 'no-extend
  (modus-themes-load-themes)
  :config
  (modus-themes-load-vivendi)
  :bind ("<f5>" . modus-themes-toggle))



;; (define-minor-mode my/modus-themes-tinted
;;   "Tweak some Modus themes colors."
;;   :init-value nil
;;   :global t
;;   (if my/modus-themes-tinted
;;       (setq modus-themes-operandi-color-overrides
;;             '((bg-main . "#fefcf4")
;;               (bg-dim . "#faf6ef")
;;               (bg-alt . "#f7efe5")
;;               (bg-hl-line . "#f4f0e3")
;;               (bg-active . "#e8dfd1")
;;               (bg-inactive . "#f6ece5")
;;               (bg-region . "#c6bab1")
;;               (bg-header . "#ede3e0")
;;               (bg-tab-bar . "#dcd3d3")
;;               (bg-tab-active . "#fdf6eb")
;;               (bg-tab-inactive . "#c8bab8")
;;               (fg-unfocused . "#55556f"))
;;             modus-themes-vivendi-color-overrides
;;             '(
;;               ;; (bg-main . "#100b17")  ; makes emacs in terminal all light blue bg
;;               ;; (bg-main . "#2e3440")  ; nord-0
;;               ;; (bg-main . "#3b4252")  ; nord-1
;;               (bg-dim . "#161129")
;;               (bg-alt . "#1e1e1e")  ; original  "#181732" bad in terminal
;;               (bg-hl-line . "#191628")
;;               (bg-active . "#282e46")
;;               (bg-inactive . "#1a1e39")
;;               (bg-region . "#393a53")
;;               (bg-header . "#202037")
;;               (bg-tab-bar . "#262b41")
;;               (bg-tab-active . "#120f18")
;;               (bg-tab-inactive . "#3a3a5a")
;;               (fg-unfocused . "#9a9aab")))
;;     (setq modus-themes-operandi-color-overrides nil
;;           modus-themes-vivendi-color-overrides nil)))

;; (set-face-attribute 'org-verbatim nil :foreground "#ffb3de")
;; (set-face-attribute 'org-scheduled-previously nil :foreground "#bb3385")
;; ;; (set-face-attribute 'org-scheduled-today nil :foreground "#d6b0ff")
;; (set-face-attribute 'org-scheduled-today nil :foreground "#fff")
;; (set-face-attribute 'org-scheduled nil :foreground "#c4c3d0")
;; (set-face-attribute 'org-agenda-clocking nil :foreground "#44ddff" :background "#000")


;; (set-face-attribute 'line-number nil :background "#000000")  ;; line number background is too distinct

;; ;; (modus-themes-load-vivendi)
