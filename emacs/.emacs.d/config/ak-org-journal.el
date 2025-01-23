(provide 'ak-org-journal)

(use-package org-journal
  :ensure t
  :defer t
  :init
  (setq org-journal-prefix-key "")
  :config
  (setq  org-journal-dir "~/org/journal/"
         org-journal-file-type 'daily
         org-journal-file-format "%Y-%m-%d.org"
         org-journal-date-format "%Y-%m-%d, %a"
	 ;; File structure and header
         org-journal-date-prefix "* "
         org-journal-time-prefix "** "
	 org-journal-file-header "#+TITLE: %Y-%m-%d, %a")
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

;; #+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"../assets/org-export/org-html-default-styles.css\">"


(defun insert-weekly-overview ()
  (interactive)
  (insert " Weekly Overview          :reflection:
*** Top of Mind
*** Priorities
*** Work
*** Projects
*** Health
*** Routine
*** Goals
*** Tasks
- [ ] Email
- [ ] Text Messages
- [ ] Financial Review
"))
