;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Project Time Tracking Orgmode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ak-time-tracking)

(defun my-org-select-project ()
  "Select a project from a specific Org file, excluding certain headings."
  (with-current-buffer (find-file-noselect (concat org-directory "/projects/project_time.org"))
    (let ((excluded-headings '("TIME REPORTS" "DAY" "WEEK" "MONTH"))
          (projects '()))
      (org-map-entries
       (lambda ()
         (let ((heading (org-get-heading t t)))
           (unless (member heading excluded-headings)
             (push heading projects)))))
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
    (with-current-buffer (find-file-noselect (concat org-directory "/projects/project_time.org"))
      (goto-char (point-min))
      (re-search-forward (format "^*+\\s-+%s\\s-*$" (regexp-quote project)))
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
