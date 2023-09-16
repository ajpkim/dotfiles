(provide 'ak-org-journal)

(use-package org-journal
  :ensure t
  :defer t
  :init
  ;; disable default key-bindings: https://github.com/bastibe/org-journal/pull/278#issuecomment-664986601 (allows for user customization entirely)
  (setq org-journal-prefix-key "")
  :config
  (setq  org-journal-dir "~/org/journal/"
         org-journal-date-format "%Y-%m-%d, %a"
	 ;; It's nice to have each days journal in a single org tree mobility with date as top-level header.
         org-journal-date-prefix "* "
         org-journal-time-prefix "** "
         org-journal-file-header "#+TITLE: %Y-%m-%d, %a\n"
         org-journal-file-format "%Y-%m-%d.org"
         org-journal-file-type 'daily
         ;; org-journal-carryover-items ""  ;; Default behavior is to carryover TODOs.
         )
  :bind (("C-c j" . org-journal-new-entry)
         ("C-c J" . org-journal-open-current-journal-file)
         ("C-c s" . org-journal-search)
	 :map org-journal-mode-map
	 ("C-c B" . org-journal-previous-entry)
	 ("C-c F" . org-journal-next-entry)
         ))


(defcustom org-journal-find-file 'find-file
  "The function to use when opening an entry.
  Set this to `find-file' if you don't want org-journal to split your window."
  :type 'function)


;; Weekly planning
(defun insert-weekly-planning-template ()
  (interactive)
  (insert "** 2023 WXXX Week Planning and Review
*** Reflection
*** Focus Areas
*** Project Time Allocation
|---------+------+-----------|
| Project | Goal | Completed |
|---------+------+-----------|
|         |      |           |
|---------+------+-----------|
| Total   |      |           |
|---------+------+-----------|
#+TBLFM: @>$2=vsum(@II..@III)
#+TBLFM: @>$3=vsum(@II..@III)

*** Daily Sketch
*** Upcoming Events and Planning
*** Week Goals"))
