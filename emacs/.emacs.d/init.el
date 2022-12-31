;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bootstrap use-package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require `package)
(setq package-enable-at-startup nil)
(add-to-list `package-archives
	     `("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p `use-package)
  (package-refresh-contents)
  (package-install `use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Put all the changes made by customize into a tmp file
(setq custom-file (make-temp-file "emacs-custom"))

;; Add all my custom config dir to the load-path
(add-to-list 'load-path "~/.emacs.d/config")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load all my configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ak-base)
(require 'ak-modus)
(require 'ak-visual)
(require 'ak-text)
(require 'ak-help)
(require 'ak-olivetti)
(require 'ak-files)
(require 'ak-prog)

;; Org-mode stuff
(require 'ak-org)
(require 'ak-org-roam)
(require 'ak-org-journal)
(require 'ak-citations)

;; Modes
(require 'ak-focus-mode)

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

(message "Loaded AK emacs config")
