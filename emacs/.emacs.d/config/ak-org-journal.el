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
         org-journal-file-header "#+TITLE: %Y-%m-%d, %a
#+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"../assets/org-export/org-html-default-styles.css\">"
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

(defun my-insert-weekly-reflection-template ()
  (interactive)
  (insert "2024 WXX Week reflection    :reflection:
*** Tasks
- [ ] Reflection
- [ ] Growth Review
- [ ] Project Review
- [ ] Work Review
- [ ] Financial Review
- [ ] Task Inbox
- [ ] Social Responses

*** Reflection
*** Growth
*** Projects
*** Work
*** Finances
"))

(defun my-insert-day-plan-template ()
  (interactive)
  (insert "- Awake:
- Morning Routine:
- Morning Reading:
- Morning Study:
- Block 1:
- Lunch:
- Block 2:
- Block 3:
- Dinner:
- Evening Activity:
- Bed:
"))
