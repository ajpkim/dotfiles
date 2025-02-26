;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bootstrap straight and use-package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package) ; Initialize package sources
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Put all the changes made by customize into a tmp file
(setq custom-file (make-temp-file "emacs-custom"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Quickly access and reload config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun config-visit ()
  (interactive)
  (find-file "~/dotfiles/emacs/.emacs.d/init.el"))

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~//dotfiles/emacs/.emacs.d/init.el")))

(global-set-key (kbd "C-c e") 'config-visit)
(global-set-key (kbd "C-c r") 'config-reload)

;; Otherwise we get a TON of warning buffers when building with native comp
(setq warning-minimum-level :error)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load all my configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/config")

;; Core functionality
(require 'ak-base)
(require 'ak-modus-themes)
(require 'ak-text)  ;; custom text insert insertions e.g. "→"
(require 'ak-files)  ;; personal file shortcuts
(require 'ak-ivy)  ;; search
(require 'ak-company)  ;; auto-complete
(require 'ak-eglot)  ;; inteface with LSP servers
(require 'ak-treesitter)  ;; syntax highlighting + structured editing
(require 'ak-magit)
(require 'ak-projectile)
(require 'ak-modeline)

;; ;; Org-mode stuff
(require 'ak-org)
(require 'ak-org-roam)
(require 'ak-org-journal)
(require 'ak-citations)

;; ;; Custom modes
(require 'ak-focus-mode)

;; ;; Languages and programming
(require 'ak-common-lisp)
(require 'ak-css)
(require 'ak-csv)
(require 'ak-docker)
(require 'ak-haskell)
(require 'ak-javascript-typescript)
(require 'ak-json)
(require 'ak-latex)
(require 'ak-lua)
(require 'ak-prog)
(require 'ak-python)
(require 'ak-scheme)
(require 'ak-terraform)
(require 'ak-yaml)
(require 'ak-go)

;; ;; Experimental
;; (require 'ak-test)

;; Not using
;; (require 'ak-gpg)
;; (require 'ak-anki)
;; (require 'ak-time-tracking)


;; Random stuff that emacs prompts us for that we need to configure
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(message "Loaded AK emacs config")
