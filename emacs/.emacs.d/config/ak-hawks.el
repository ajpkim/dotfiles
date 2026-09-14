;;; ak-hawks.el --- Hawks work org-mode configuration -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hawks work org-mode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-hawks)

(setq org-directory "~/hawks/")

(use-package org
  :config
  (setq
   org-startup-indented nil
   org-startup-folded 'show2levels
   ;; org-hide-emphasis-markers nil  ;; don't hide formatting chars
   ;; org-pretty-entities nil        ;; conflicts with latex
   ;; org-startup-with-inline-images nil
   ;; org-image-actual-width 800
   ;; org-startup-with-latex-preview nil  ;; slow when enabled
   org-archive-location (concat (expand-file-name "archive/" org-directory) "%s_archive::")
   org-todo-keywords '((sequence "PROJECT(p)" "TODO(t)" "ACTIVE(a)" "WAITING(w)" "|" "DONE(d)"))
   org-todo-keyword-faces '(("PROJECT" . (:foreground "steel blue1" :weight bold))
			    ("TODO" . (:foreground "orchid" :weight bold))
                            ("ACTIVE" . (:foreground "cyan" :weight bold))
			    ("WAITING" . (:foreground "powder blue" :weight bold))
			    ))
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-x n t" . org-toggle-narrow-to-subtree))
  :hook
  (org-mode . visual-line-mode)
  (org-mode . olivetti-mode))

(use-package mixed-pitch
  :ensure t
  :hook (org-mode . mixed-pitch-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Capture
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-capture-templates
      `(("c" "Task"
         entry (file ,(expand-file-name "todo.org" org-directory))
         "* TODO %?\n"
         :prepend t)

        ("l" "Log"
         entry (file+olp+datetree ,(expand-file-name "log.org" org-directory))
         "* %<%H:%M> %?\n"
         :tree-type day)))

(setq org-refile-targets '((org-agenda-files :todo . "PROJECT")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Agenda
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-agenda-files (list (expand-file-name "todo.org" org-directory)))
(setq org-agenda-span 7)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-skip-deadline-if-done nil)
(setq org-agenda-skip-scheduled-if-done nil)
(setq org-deadline-warning-days 3)


(defun ak-hawks-org-agenda-set-faces ()
  "Set Org agenda faces based on whether the active theme is light or dark."
  (if (member (car custom-enabled-themes) '(modus-vivendi modus-vivendi-tinted modus-vivendi-tritanopia))
      ;; Dark mode settings
      (custom-set-faces
       '(org-scheduled ((t (:foreground "#c4c3d0"))))
       '(org-scheduled-today ((t (:foreground "#c0d8f8" :weight bold))))
       '(org-scheduled-previously ((t (:foreground "#ff5f5f" :slant italic)))))
    ;; Light mode settings
    (custom-set-faces
     '(org-scheduled ((t (:foreground "#707070"))))
     '(org-scheduled-today ((t (:foreground "#3a6ea5" :weight bold))))
     '(org-scheduled-previously ((t (:foreground "#af0000" :slant italic)))))))


(add-hook 'modus-themes-after-load-theme-hook #'ak-hawks-org-agenda-set-faces)
(ak-hawks-org-agenda-set-faces)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-roam
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (expand-file-name "notes/" org-directory))
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-db-autosync-mode 1))

(setq org-roam-capture-templates
      '(("n" "note" plain "%?"
         :target (file+head "${slug}.org"
                             "#+title: ${title}\n#+created: %U\n")
         :immediate-finish t :unnarrowed t)))

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))

(defun ak-hawks-org-roam-rg ()
  "Ripgrep search over `org-roam-directory' using Ivy/Counsel."
  (interactive)
  (require 'counsel)
  (counsel-rg nil org-roam-directory))

(global-set-key (kbd "C-c n /") #'ak-hawks-org-roam-rg)

;; Graph UI at localhost; invoke manually with `org-roam-ui-mode'
(use-package org-roam-ui
  :ensure t
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start nil))


;; Quick access to high use files.
;; See for details on keybinding: https://www.masteringemacs.org/article/mastering-key-bindings-emacs

(defun ak-hawks-file-shortcut (file)
  "Open given FILE in current frame or new frame if invoked with prefix arg."
  (interactive)
  (if (file-exists-p file)
      (if (equal current-prefix-arg nil)
          (find-file file)
        (find-file-other-frame file))))

(global-set-key (kbd "C-c f t") (lambda () (interactive) (ak-hawks-file-shortcut (expand-file-name "todo.org" org-directory))))
(global-set-key (kbd "C-c f l") (lambda () (interactive) (ak-hawks-file-shortcut (expand-file-name "log.org" org-directory))))


(require 'org-tempo)
