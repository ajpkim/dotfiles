(provide 'ak-work)

(defun open-hawks-narrow ()
  "Open ~/org/work.org and narrow to the top-level tree named HAWKS."
  (interactive)
  (find-file "~/org/work.org")
  (goto-char (point-min))
  (if (re-search-forward "^\\*\\s-+HAWKS\\b" nil t)
      (org-narrow-to-subtree)
    (message "Heading 'HAWKS' not found.")))

(global-set-key (kbd "C-c f h") 'open-hawks-narrow)
