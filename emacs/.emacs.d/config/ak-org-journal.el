(provide 'ak-org-journal)

(use-package org-journal
  :ensure t
  :defer t
  :init
  (setq org-journal-prefix-key "")
  :config
  (setq  org-journal-dir "~/org/journal/"
         org-journal-date-format "%Y-%m-%d, %a"
         org-journal-date-prefix "* "
         org-journal-time-prefix "** "
         org-journal-file-header "#+TITLE: %Y-%m-%d, %a"
         org-journal-file-format "%Y-%m-%d.org"
         org-journal-file-type 'daily
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

(defun my-insert-weekly-planning-template ()
  (interactive)
  (insert "2023 WXXX WEEK PLANNING
*** Feelings and Thoughts
*** Focus Areas and Week Goals
*** Upcoming Events
*** Project Time
|---------+------|
| Project | Goal |
|---------+------|
|         |      |
|---------+------|
| Total   |      |
|---------+------|
#+TBLFM: @>$2=vsum(@II..@III)
#+TBLFM: @>$3=vsum(@II..@III)
"))

(defun my-insert-day-plan-template ()
  (interactive)
  (insert "- Awake:
- Morning Routine:
- Morning Reading:
- Block 1:
- Lunch:
- Block 2:
- Block 3:
- Dinner:
- Evening Activity:
- Bed:
"))

(defun my-org-journal-entry-template ()
  "Inserts custom template text for new org-journal entries."
  (interactive)
  (goto-char (point-max))
  (insert "
** TODAY
*** PLAN
*** HABITS
- [ ] Sleep
- [ ] Meditate
- [ ] Exercise
- [ ] Socialize
- [ ] Nutrition
- [ ] Read
- [ ] Code
- [ ] Journal
*** EVENTS
"))

(add-hook 'org-journal-after-header-create-hook 'my-org-journal-entry-template)
