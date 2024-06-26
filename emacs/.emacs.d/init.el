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

(require 'ak-base)
(require 'ak-modus)
(require 'ak-visual)
(require 'ak-text)
(require 'ak-help)
(require 'ak-olivetti)
(require 'ak-files)
(require 'ak-ivy)

(require 'ak-company)
(require 'ak-treesitter)

(require 'ak-magit)
(require 'ak-projectile)
(require 'ak-gpg)
(require 'ak-anki)
(require 'ak-modeline)

;; Org-mode stuff
(require 'ak-org)
(require 'ak-org-roam)
(require 'ak-org-journal)
(require 'ak-citations)
(require 'ak-time-tracking)

;; Custom modes
(require 'ak-focus-mode)

;; Languages and development
(require 'ak-css)
(require 'ak-csv)
(require 'ak-docker)
(require 'ak-eglot)
(require 'ak-js-ts)
(require 'ak-json)
(require 'ak-latex)
(require 'ak-lua)
(require 'ak-prettier-js)
(require 'ak-prog)
(require 'ak-python)
(require 'ak-haskell)
(require 'ak-scheme)
(require 'ak-yaml)
;; Experimental
(require 'ak-test)

(message "Loaded AK emacs config")
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
