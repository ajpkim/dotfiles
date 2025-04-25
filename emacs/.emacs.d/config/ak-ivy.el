;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Search framework with Ivy, Swiper, and Counsel
;; Documentation: http://oremacs.com/
;; "counsel" brings in "ivy" and "swiper" as deps.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-ivy)

(use-package counsel
  :ensure t
  :config
  (setq ivy-count-format "%d/%d | "
	ivy-use-virtual-buffers t)
  :init
  (ivy-mode 1)
  :bind
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Remapped common functions
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ("C-s" . swiper-isearch)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("M-y" . counsel-yank-pop)
  ("C-x b" . ivy-switch-buffer)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Counsel powered git grepping
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ("C-c C-i l" . counsel-git-grep)
  ("C-c C-i g" . counsel-git-grep)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Lesser used functions
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ("C-c C-f" . counsel-fzf)
  ("C-c C-i f" . counsel-describe-function)
  ("C-c C-i v" . counsel-describe-variable)
  ("C-c C-i l" . counsel-find-library)
  ("C-c C-i i" . counsel-info-lookup-symbol)
  ("C-c C-i u" . counsel-unicode-char)
  ("C-c C-i j" . counsel-set-variable))


;; TODO: try these
;; (global-set-key (kbd "C-c v") 'ivy-push-view)
;; (global-set-key (kbd "C-c V") 'ivy-pop-view)

;; Packages I used to use but not sure I want/need

;; (use-package ivy-rich
;;   :ensure t
;;   :init (ivy-rich-mode 1))

;; (use-package ivy-posframe
;;   :ensure t)
