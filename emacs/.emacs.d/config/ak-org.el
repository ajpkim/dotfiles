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
        org-pretty-entities nil
        org-startup-folded t
        org-extend-today-until 2
        org-archive-location "~/org/archives/%s_archive::"
        org-id-link-to-org-use-id 'create-if-interactive
        org-refile-targets '((org-agenda-files :todo . "PROJECT"))
        org-refile-use-outline-path nil
        org-outline-path-complete-in-steps nil
	org-toggle-pretty-entities -1
        )
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-x n t" . org-toggle-narrow-to-subtree))
  :hook
  (org-mode . visual-line-mode)
  (org-mode . olivetti-mode))
