;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Base Orgmode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-org)

(use-package org
  :config
  (setq
   ;; UI
   org-startup-indented nil
   ;; org-ellipsis " »"
   org-startup-folded 'show2levels
   org-hide-emphasis-markers nil  ;; don't hide formatting chars
   org-pretty-entities nil  ;; Don't depict '\alpha' to symbol... conflicts with latex
   ;; Performance and images
   org-startup-with-inline-images nil
   org-image-actual-width 800
   org-startup-with-latex-preview nil  ;; SLOW when enabled
   org-format-latex-options (plist-put org-format-latex-options :scale 3.5)
  ;; Etc
  org-archive-location "~/org/archives/%s_archive::")
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-x n t" . org-toggle-narrow-to-subtree))
  :hook
  (org-mode . visual-line-mode)
  (org-mode . olivetti-mode))

;; Package for simple prettification of org-mode
(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Maintain fixed pitch faces for specific faces in org mode.
;; See: https://github.com/daviwil/emacs-from-scratch/blob/c55d0f5e309f7ed8ffa3c00bc35c75937a5184e4/init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun ak/org-variable-pitch-setup ()
  "Set up mixed fixed-pitch and variable-pitch fonts for Org-mode."
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(define-minor-mode ak/org-variable-pitch-mode
  "Toggle smart variable-pitch mode for Org-mode."
  :init-value nil
  :lighter " SVP"
  :group 'org
  (if ak/org-variable-pitch-mode
      (progn
        (variable-pitch-mode 1)
        (ak/org-variable-pitch-setup))
    (variable-pitch-mode -1)))

(add-hook 'org-mode-hook #'ak/org-variable-pitch-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Capture
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-capture-templates
      '(("c" "Task"
	 entry (file "~/org/todo.org")
         "* TODO %?\n"
         :prepend t)

        ("d" "Dream journal"
	 plain (file+olp+datetree "~/org/dreams.org")
         "%?"
         :tree-type 'daily)

        ("f" "File Link"
	 entry (file+headline "~/org/todo.org" "Inbox")
         "* TODO %a\n%?"
         :prepend t)

        ("w" "Writing Inbox"
	 entry (file "~/org/notes/writing_inbox.org")
         "* %?\n"
         :prepend t)

	;; Read/Watch/Listen templates
        ("r" "Read, Watch, Listen")
        ("rr" "Read" entry
         (file+headline "~/org/rwl.org" "Reading")
         "* %?\     :read:\n"
         :prepend t)

        ("rw" "Watch" entry
         (file+headline "~/org/rwl.org" "Watching")
         "* %?     :watch:\n"
         :prepend t)

        ("rl" "Listen" entry
         (file+headline "~/org/rwl.org" "Listening")
         "* %?     :listen:\n"
         :prepend t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Agenda
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-super-agenda
  :ensure t
  :config
  (org-super-agenda-mode))

(setq org-super-agenda-groups
      '((:name "Habits"
               :habit t)
        (:name "Overdue"
               :scheduled past
               :deadline past)
        (:name "Today"
               :time-grid t
               :scheduled t)
        (:name "Upcoming"
               :deadline future
               :scheduled future)
        (:name "Unscheduled"
               :not (:scheduled t :deadline t))))


(setq org-agenda-custom-commands
      '(("t" "Today (Time-Blocked)"
         ((agenda ""
                  ((org-agenda-span 1)
                   (org-super-agenda-groups org-super-agenda-groups)))))

	("w" "Week View"
         ((agenda ""
                  ((org-agenda-span 7)
                   (org-super-agenda-groups org-super-agenda-groups)))))

	("W" "Work Projects"
         ((alltodo ""
                   ((org-agenda-files '("~/org/work.org"))
                    (org-agenda-max-level 2)
                    (org-super-agenda-groups
                     '((:name "By Category"
                              :auto-category t)))))))

        ("p" "Personal Projects"
         ((alltodo ""
                   ((org-agenda-files '("~/org/projects.org"))
                    (org-agenda-max-level 2)
                    (org-super-agenda-groups
                     '((:name "By Category"
                              :auto-category t)))))))

        ("5" "Quick Tasks (5m)"
         ((alltodo ""
                   ((org-super-agenda-groups
                     '((:name "Quick Tasks"
                              :tag "5m")
                       (:discard (:anything t))))))))

	("r" "Read, Watch, Listen"
	 ((tags "+read|+watch|+listen"
		((org-super-agenda-groups
		  '((:name "Read" :tag "read")
		    (:name "Watch" :tag "watch")
		    (:name "Listen" :tag "listen")
		    (:discard (:anything t))))))))

        ("g" "General Tasks (Scheduled and Unscheduled)"
         ((alltodo ""
                   ((org-agenda-files '("~/org/todo.org"))
                    (org-super-agenda-groups
                     '((:name "Scheduled Generic Tasks"
                              :scheduled t)
                       (:name "Unscheduled Generic Tasks"
                              :not (:scheduled t :deadline t))
                       (:discard (:anything t))))))))))


(setq org-agenda-files '("~/org/todo.org" "~/org/projects.org" "~/org/work.org" "~/org/rwl.org"))
(setq org-extend-today-until 3)
(setq org-agenda-span 7)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-skip-deadline-if-done nil)
(setq org-agenda-skip-scheduled-if-done nil)
(setq org-deadline-warning-days 3)
(setq org-agenda-prefix-format " %i %-15:c%?-12t% s")
(setq org-agenda-use-time-grid t)
(setq org-agenda-window-setup 'current-window)
(setq org-agenda-time-grid
      '((daily today)
	;; Hour markers
        (800 1000 1200 1400 1600 1800 2000)
	;; Visual separators
        "......" "----------------"))

;; I don't like the defaut modus theme agenda colors
(defun ak/org-agenda-set-faces ()
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


(add-hook 'modus-themes-after-load-theme-hook #'ak/org-agenda-set-faces)
(ak/org-agenda-set-faces)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tree management e.g. refiling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-refile-targets
      `((nil . (:maxlevel . 2))  ;; current buffer
	("~/org/projects.org" . (:maxlevel . 3))
        ("~/org/work.org" . (:maxlevel . 2))))

(setq org-refile-use-outline-path 'file)  ;; Include file name in refile paths
(setq org-outline-path-complete-in-steps nil)  ;; Full path selection in one step
(setq org-refile-allow-creating-parent-nodes 'confirm)  ;; Allow dynamic creation of parent nodes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Archiving
;; Functions for quicklky archiving all Done tasks in a tree or a file.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun ak-org-archive-done-tasks-file ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (org-element-property :begin (org-element-at-point))))
   "/DONE" 'file))

(defun ak-org-archive-done-tasks-tree ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (org-element-property :begin (org-element-at-point))))
   "/DONE" 'tree))

(define-key org-mode-map (kbd "C-c C-x C-f") 'ak-org-archive-done-tasks-file)
(define-key org-mode-map (kbd "C-c C-x C-t") 'ak-org-archive-done-tasks-tree)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Babel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ob-python)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (haskell    . t)
   (js         . t)
   (latex      . t)
   (python     . t)
   (scheme     . t)
   (shell      . t)
   (sql        . t)))

;; Problem langs...
;; (go         . t)
;; (json       . t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Exporting
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'ox-html)

(use-package htmlize
  :ensure t
  :config
  (setq org-html-htmlize-output-type 'css))

(setq org-export-with-broken-links t)

;; ;; Clean the html export
;; (setq org-html-head ""
;;       org-export-headline-levels 10
;;       org-export-with-section-numbers nil
;;       org-export-with-tags nil
;;       ;; org-export-with-toc nil
;;       org-export-with-broken-links t
;;       org-html-doc-type "HTML5"
;;       org-html-head-extra ""
;;       org-html-head-include-default-style nil
;;       org-html-head-include-scripts nil
;;       org-html-html5-fancy t
;;       org-html-mathjax-template ""
;;       org-html-postamble nil
;;       org-html-preamble nil
;;       org-html-use-infojs nil
;;       org-html-head-include-scripts nil
;;       )

;; (use-package toc-org
;;   :ensure t
;;   :config
;;   (setq toc-org-max-depth 3
;;         toc-org-hrefify-default "org"))  ;; Options are org or gh (github)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; TODO
;; ;; Org IDs
;; ;; Have stable IDs for exporting
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode modules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-tempo enables expanding structs like code blocks from "<s + TAB"
(require 'org-tempo)
(require 'org-habit)
