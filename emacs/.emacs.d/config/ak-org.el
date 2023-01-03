;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Base Orgmode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-org)

(use-package org
  :config
  (setq org-startup-indented t
        ;; org-ellipsis " »"
        org-hide-emphasis-markers t
        org-startup-with-inline-images t
        org-image-actual-width 800  ;; adjust as nec.
        org-startup-with-latex-preview nil  ;; SLOW
        org-format-latex-options (plist-put org-format-latex-options :scale 3.5)
        org-pretty-entities t
        org-startup-folded t
        org-extend-today-until 2
        org-archive-location "~/org/archives/%s_archive::"
        org-id-link-to-org-use-id 'create-if-interactive
        org-refile-targets '((org-agenda-files :todo . "PROJECT"))
        org-refile-use-outline-path nil
        org-outline-path-complete-in-steps nil
        )
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-x n t" . org-toggle-narrow-to-subtree))
  :hook
  (org-mode . visual-line-mode)
  (org-mode . olivetti-mode))

;; org-tempo enables expanding structs like code blocks from "<s + TAB"
(require 'org-tempo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Maintain fixed pitch faces for specific faces in org mode.
;; See: https://github.com/daviwil/emacs-from-scratch/blob/c55d0f5e309f7ed8ffa3c00bc35c75937a5184e4/init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Capture
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-capture-templates
      '(

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; Anki templates
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ("a" "Anki")

        ("aa" "Anki basic"
         entry (file+headline org-my-anki-file "New Cards")
         "* %U %^g \n:PROPERTIES:\n:CREATED: %U\n:ANKI_NOTE_TYPE: Basic\n:ANKI_DECK: main\n:ANKI_TAGS:\n:END:\n** Front\n%?\n** Back\n\n")

        ("ac" "Anki cloze"
         entry
         (file+headline org-my-anki-file "New Cards")
         "* %U  %^g \n:PROPERTIES:\n:CREATED: %U\n:ANKI_NOTE_TYPE: Cloze\n:ANKI_DECK: main\n:ANKI_TAGS:\n:END:\n** Text\n%?\n** Extra\n\n")

        ("at" "Anki Type"
         entry
         (file+headline org-my-anki-file "New Cards")
         "* %U  %^g\n:PROPERTIES:\n:CREATED: %U\n:ANKI_NOTE_TYPE: Type\n:ANKI_DECK: main\n:ANKI_TAGS:\n:END:\n** Front\n%?\n** Back\n\n")

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Common capture sequences
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ("c" "Task"
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

        ("s" "Shelf"
	 entry (file "~/org/shelf.org")
         "* %?\n"
         :prepend t)

        ("w" "Writing Inbox"
	 entry (file "~/org/notes/inbox.org")
         "* %?\n"
         :prepend t)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Passtur
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	("M" "Passtur Meeting"
	 entry (file+headline "~/org/passtur.org" "Meetings")
         "* %u %?

*WHO*:

*PREP*:

*NOTES*:

*ACTION ITEMS*:
"
         :prepend t)

        ("P" "Passtur Inbox"
	 entry (file+headline "~/org/passtur.org" "Passtur Inbox")
         "* TODO %?\n"
         :prepend t)
        ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org TODO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-todo-keywords
      '((sequence "PROJECT(p)" "TODO(t)" "ACTIVE(a)" "LATER(l)" "|" "DONE(d)")))

(setq org-todo-keyword-faces
      '(
        ("PROJECT" . (:foreground "#79a8ff" :weight bold))
        ("TODO" . (:foreground "#fbd6f4" :weight bold))
        ("ACTIVE" . (:foreground "#44ddff" :weight bold))
        ("LATER" . (:foreground "#d3d3d3" :weight bold))
        ("DONE" . (:foreground "#6ae4b9" :weight bold))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org agenda
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-agenda-span 5
      org-agenda-start-on-weekday nil
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-todo-ignore-deadlines nil
      org-agenda-todo-ignore-scheduled nil
      org-deadline-warning-days 3
      org-agenda-window-setup 'current-window
      org-agenda-prefix-format " %i %-12:c%?-12t% s"
      )

;; (set-face-attribute 'org-agenda-calendar-event nil :foreground "#d6b0ff")

(setq org-agenda-files '("~/org/todo.org"
			 "~/org/shelf.org"
			 "~/org/passtur.org"
			 "~/org/projects.org"
			 "~/org/lists.org"
			 ))

(setq org-agenda-custom-commands
      '(
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Day and Week views
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ("d" "Today's Agenda"
         ((agenda "Today's Agenda"
                  ((org-agenda-category-filter-preset '("-passtur")))
                  ((org-agenda-span 1)))))

        ("w" "Week Agenda"
         ((agenda "Week Agenda"
                  ((org-agenda-category-filter-preset '("-passtur")))
                  ((org-agenda-span 5)))))

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Weekly Review
	;; TODO
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ;; ("W" "Weekly Review"
        ;;  ((todo ""
        ;;         ((org-agenda-files '("~/org/todo.org"))
        ;;          (org-agenda-overriding-header "Unprocessed TODOs\n")

        ;;          (org-agenda-sorting-strategy '(timestamp-up tag-up priority-down))
        ;;          (org-agenda-prefix-format "")
        ;;          ))
        ;;   ;; (agenda "" ((org-agenda-span 7))); review upcoming deadlines and appointments
        ;;   (todo "ACTIVE"
        ;;         ((org-agenda-overriding-header "Review Active Tasks\n")
        ;;          (org-agenda-sorting-strategy '(priority-down))))
        ;;   (tags-todo "+TODO=\"PROJECT\"+LEVEL=1"  ;; review top level projects
        ;;              ((org-agenda-overriding-header "Review Projects\n")
        ;;               (org-agenda-prefix-format "")))
        ;;   ))

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Projects
	;; TODO: make this list all the projects and then their todos underneath
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	("p" "projects"
	 ((tags-todo "+TODO=\"PROJECT\""
                     ((org-agenda-overriding-header "PROJECTs\n")
                      (org-agenda-sorting-strategy '(timestamp-up tag-up priority-down))
                      (org-agenda-prefix-format "")
                      ))))

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Passtur
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ("P" "Passtur"
         ((tags-todo "CATEGORY=\"passtur\"+TODO=\"PROJECT\""
                     ((org-agenda-overriding-header "PASSTUR PROJECTs\n")
                      (org-agenda-sorting-strategy '(timestamp-up tag-up priority-down))
                      (org-agenda-prefix-format "")
                      ))
          (tags-todo "CATEGORY=\"passtur\"+TODO=\"ACTIVE\""
                     ((org-agenda-overriding-header "Passtur ACTIVEs\n")
                      (org-agenda-prefix-format "")
                      ))
          (tags-todo "CATEGORY=\"passtur\"+TODO=\"TODO\""
                     ((org-agenda-overriding-header "PASSTUR TODOs\n")
                      (org-agenda-prefix-format "")
                      )))
         )
        ))

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

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((emacs-lisp . t)
;;    (haskell    . t)
;;    (python     . t)
;;    (sql        . t)
;;    (go        . t)
;;    (latex      . t)
;;    (js         . t)
;;    (shell      . t)
;;    (scheme     . t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exporting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ox-html)

(use-package htmlize
  :ensure t
  :config
  (setq org-html-htmlize-output-type 'css))

;; Clean the html export
(setq org-html-head ""
      org-export-headline-levels 10
      org-export-with-section-numbers nil
      org-export-with-tags nil
      org-export-with-toc nil
      org-html-doc-type "HTML5"
      org-html-head-extra ""
      org-html-head-include-default-style nil
      org-html-head-include-scripts nil
      org-html-html5-fancy t
      org-html-mathjax-template ""
      org-html-postamble nil
      org-html-preamble nil
      org-html-use-infojs nil
      org-html-head-include-scripts nil
      )

(use-package toc-org
  :ensure t
  :config
  (setq toc-org-max-depth 3
        toc-org-hrefify-default "org"))  ;; Options are org or gh (github)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO
;; Org IDs
;; Have stable IDs for exporting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
