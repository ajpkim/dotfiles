;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bootstrap straight and use-package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; Org-mode stuff
(require 'ak-org)
(require 'ak-org-roam)
(require 'ak-org-journal)
(require 'ak-citations)

;; Custom modes
(require 'ak-focus-mode)

;; Languages and development
(require 'ak-prog)
(require 'ak-css)
(require 'ak-eglot)
(require 'ak-docker)
(require 'ak-python)
(require 'ak-js-ts)
(require 'ak-prettier-js)

(require 'ak-json)
(require 'ak-csv)
(require 'ak-latex)
(require 'ak-yaml)


(message "Loaded AK emacs config")
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
