(provide 'ak-base)

;; Quality of life minor modes, hooks, vars, keys
(global-set-key (kbd "C-t") 'shell)  ;; Open shell quickly
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-auto-revert-mode t)  ;; Always revert (reload) buffers on file change
(column-number-mode 1)  ;; Show col number in modeline
(electric-pair-mode 1)  ;; Create matching delims
(blink-cursor-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(set-face-attribute 'default nil :height 220)  ;; Zoom level
(delete-selection-mode 1)  ;; Overwrite selected region when typing
;; Allow Emacs to access content from clipboard.
(setq select-enable-clipboard t
      select-enable-primary t)
(setq inhibit-startup-message t)
(setq visible-bell 1)
(setq scroll-conservatively 0)  ;; Dictates whether scrolling beyond page recenters the point or not
(setq scroll-preserve-screen-position t)
(setq vc-follow-symlinks t)

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

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(global-set-key (kbd "C-x 2") `split-and-follow-horizontally)
(global-set-key (kbd "C-x 3") `split-and-follow-vertically)

;; Fast window selection
(use-package ace-window
  :ensure t
  :config (setq aw-keys `(?a ?s ?d ?f ?j ?k ?l))
  :bind ("C-x o" . ace-window))

(global-set-key (kbd "M-o") 'other-window)

;; Character selection
(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

;; Manipulate lines of text
(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode t)
  (drag-stuff-define-keys)
  :bind (("M-p" . drag-stuff-up)
	 ("M-n" . drag-stuff-down)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-c m e" . mc/edit-lines)
         ("C-c m n" . mc/mark-next-like-this)
         ("C-c m b" . mc/mark-previous-like-this)
         ("C-c m a" . mc/mark-all-like-this)
         ("C-c m r" . mc/mark-all-in-region)
         ("C-c m R" . mc/mark-all-in-region-regexp))
  :config
  ;; Make <return> insert a newline and multiple-cursors-mode can still be disabled with C-g.
  (define-key mc/keymap (kbd "<return>") nil))


;; Nice visual when the screen scolls which helps locate the point
(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(use-package rainbow-mode
  :ensure t
  :init
  (rainbow-mode 1))

;; (use-package rainbow-delimiters
;;   :ensure t
;;   :init
;;   (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


;; Show the available key bindings based on what's been typed so far
(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

;; Package for centering buffer and limiting width
(use-package olivetti
  :ensure t
  :config
  (setq-default olivetti-body-width 80)
  :bind
  ("C-c o" . olivetti-mode)
  ("C-c h o" . olivetti-set-width))
