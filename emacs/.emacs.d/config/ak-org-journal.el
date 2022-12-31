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
         org-journal-carryover-items ""  ;; Default behavior is to carryover TODOs.
         )
  :bind (("C-c j" . org-journal-new-entry)
         ("C-c J" . org-journal-open-current-journal-file)
         ("C-c s" . org-journal-search)
	 :map org-journal-mode-map
	 ("C-c b" . org-journal-previous-entry)
	 ("C-c f" . org-journal-next-entry)
         ))
