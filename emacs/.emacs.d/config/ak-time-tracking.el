;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Project Time Tracking Orgmode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-time-tracking)

(setq projects-file (concat org-directory "/projects.org"))

(defun my-org-select-project ()
  "Select a project with the TODO keyword 'PROJECT' from Org projects file."
  (with-current-buffer (find-file-noselect projects-file)
    (let (projects)
      (org-map-entries
       (lambda ()
         (when (string= (org-get-todo-state) "PROJECT")
           (push (org-get-heading t t) projects)))
       nil 'file) ; Search in the entire file
      (ivy-read "Select Project: " (nreverse projects)))))

(defun my-select-logbook-entry ()
  "Inserts a date and time string at the current point."
  (let ((start (org-read-date t))
	 (end (org-read-date t)))
    (format "CLOCK: [%s]--[%s]" start end)))

(defun my-org-log-project-time ()
  "Log time for a selected project."
  (interactive)
  (let ((project (my-org-select-project))
	(logbook-entry (my-select-logbook-entry)))
    (with-current-buffer (find-file-noselect projects-file)
      (goto-char (point-min))
      (re-search-forward (format "^*+\\s-+PROJECT %s\\s-*$" (regexp-quote project)))
      (forward-line)
      (if (looking-at ":LOGBOOK:")
	  (progn
	    (forward-line)
	    (insert logbook-entry "\n")
	    (previous-line)
	    (org-clock-update-time-maybe))
	(progn
	  (insert (format ":LOGBOOK:\n%s\n:END:\n" logbook-entry))
	  (previous-line 2)
	  (org-clock-update-time-maybe))))))

(global-set-key (kbd "C-c t") 'my-org-log-project-time)
