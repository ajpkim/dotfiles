;;; init.el --- Bootstrap package.el and use-package -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bootstrap package.el and use-package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)

;; use-package has shipped built into Emacs core since 29, so it
;; doesn't need a package manager to bootstrap it.
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Put changes made through Customize into a temporary file.
(setq custom-file (make-temp-file "emacs-custom-"))

;; Suppress most native-compilation warning buffers.
(setq warning-minimum-level :error)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Access and reload configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun config-visit ()
  "Visit the active Emacs init file."
  (interactive)
  (find-file user-init-file))

(defun config-reload ()
  "Reload the active Emacs init file."
  (interactive)
  (load-file user-init-file)
  (message "Reloaded %s" user-init-file))

(global-set-key (kbd "C-c e") #'config-visit)
(global-set-key (kbd "C-c r") #'config-reload)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration modules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list
 'load-path
 (expand-file-name "config" user-emacs-directory))

;; Core functionality
(require 'ak-base)
(require 'ak-eldoc)
(require 'ak-modus-themes)
(require 'ak-text)
;; (require 'ak-files)
(require 'ak-ivy)
(require 'ak-company)
(require 'ak-eglot)
(require 'ak-treesitter)
(require 'ak-magit)
(require 'ak-projectile)
(require 'ak-modeline)
;; (require 'ak-work)

;; Org-mode
;; (require 'ak-org)
;; (require 'ak-org-roam)
;; (require 'ak-org-journal)
;; (require 'ak-anki)
;; (require 'ak-citations)

;; Custom modes
;; (require 'ak-focus-mode)

;; Languages and programming
;; (require 'ak-common-lisp)
;; (require 'ak-css)
(require 'ak-csv)
(require 'ak-docker)
(require 'ak-flymake)
;; (require 'ak-haskell)
(require 'ak-javascript-typescript)
;; (require 'ak-json)
;; (require 'ak-latex)
;; (require 'ak-lua)
;; (require 'ak-markdown)
(require 'ak-prog)
(require 'ak-python)
(require 'ak-r)
;; (require 'ak-scheme)
;; (require 'ak-terraform)
;; (require 'ak-yaml)
(require 'ak-go)
;; (require 'ak-sql)

;; Experimental
;; (require 'ak-test)

;; Not currently used
;; (require 'ak-gpg)

;; Work
(require 'ak-hawks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; macOS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (eq system-type 'darwin)

  ;; GUI applications launched from Finder, Spotlight, or the Dock may
  ;; not inherit the same PATH as an interactive shell. This also covers
  ;; `emacs --daemon': it always starts with no frame at all (so
  ;; `display-graphic-p' is nil at init time regardless of how clients
  ;; later connect, -nw included), and here it's launched via AeroSpace's
  ;; exec-and-forget rather than a login shell, so it needs this too.
  (use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))

  ;; Native GNU Emacs macOS builds generally use the ns-* variables.
  ;; Keep Option as Meta and expose Command as Super.
  (when (boundp 'ns-option-modifier)
    (setq ns-option-modifier 'meta
          ns-command-modifier 'super))

  ;; Emacs Mac Port uses the mac-* equivalents.
  (when (boundp 'mac-option-modifier)


    (setq mac-option-modifier 'meta
          mac-command-modifier 'super)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable normally disabled commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(message "Loaded AK Emacs config from %s" user-init-file)
