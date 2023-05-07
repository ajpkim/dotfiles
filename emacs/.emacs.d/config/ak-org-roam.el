(provide 'ak-org-roam)

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org/notes/")
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; We add a note type so that we can display it when we display the notes in UI
  :config
  (cl-defmethod org-roam-node-type ((node org-roam-node))
    "Return the TYPE of NODE."
    (condition-case nil
        (file-name-nondirectory
         (directory-file-name
          (file-name-directory
           (file-relative-name (org-roam-node-file node) org-roam-directory))))
      (error "")))
  (setq org-roam-node-display-template
        (concat "${type:10} ${title:*} " (propertize "${tags:25}" 'face 'org-tag)))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (org-roam-db-autosync-mode 1)
  )

;; Label all new nodes with "draft"
(defun ak-tag-new-node-as-draft ()
  (org-roam-tag-add '("draft")))

(add-hook 'org-roam-capture-new-node-hook #'ak-tag-new-node-as-draft)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org roam capture templates
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-roam-capture-templates
      '(
        ("l" "leaf" plain "%?"
         :if-new (file+head "leaf/${slug}.org" "#+title: ${title}\n#+created: %U\n")
         :immediate-finish t
         :unnarrowed t)

	("p" "personal" plain "%?"
         :if-new (file+head "leaf/${slug}.org" "#+title: ${title}\n#+created: %U\n#+filetags: :private:")
         :immediate-finish t
         :unnarrowed t)

	("P" "project" plain "%?"
         :if-new (file+head "projects/${slug}.org" "#+title: ${title}\n#+created: %U\n#+filetags: :project:")
         :immediate-finish t
         :unnarrowed t)

        ("m" "main" plain "%?"
         :if-new (file+head "main/${slug}.org" "#+title: ${title}\n#+created: %U\n")
         :immediate-finish t
         :unnarrowed t)

        ("r" "ref" plain "%?"
         :if-new (file+head "ref/${slug}.org" "#+title: ${title}\n#+created: %U\n")
         :immediate-finish t
         :unnarrowed t)
	))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Citing papers and source materials
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ak-org-roam-node-from-cite (citation)
  (interactive (list (citar-select-ref)))
  (let ((title (citar-format--entry "${author} - ${title}"
                                    citation)))
    (org-roam-capture- :templates
                       '(("s" "source" plain "%?" :if-new
                          (file+head "ref/${citekey}.org"
                                     ":PROPERTIES:
:ROAM_REFS: [cite:@${citekey}]
:END:
#+title: ${title}\n#+created: %U\n")
                          :immediate-finish t
                          :unnarrowed t))
                       :info (list :citekey citation)
                       :node (org-roam-node-create :title title)
                       :props '(:finalize find-file))))

(global-set-key (kbd "C-c n s") 'ak-org-roam-node-from-cite)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-roam-ui
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-roam-ui
  :ensure t
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))
