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
  ;; Define a note type for display templates
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

  (org-roam-db-autosync-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org roam capture templates
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ak-org-roam-template (type slug filetags)
  `(,type ,slug plain "%?"
          :if-new (file+head ,(concat slug "/${slug}.org")
                             ,(concat "#+title: ${title}\n#+created: %U\n"
                                      (if filetags (concat "#+filetags: " filetags "\n"))))
          :immediate-finish t :unnarrowed t))

(setq org-roam-capture-templates
      (list
       (ak-org-roam-template "l" "leaf" nil)
       (ak-org-roam-template "m" "main" nil)
       (ak-org-roam-template "r" "ref" nil)))

;; ;; Automatically tag new nodes as "new"
(defun ak-tag-new-node ()
  "Add 'new' tag to new Org-roam nodes."
  (org-roam-tag-add '("new")))
(add-hook 'org-roam-capture-new-node-hook #'ak-tag-new-node)

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
;; org roam buffer customization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Defaults from for manual
(setq org-roam-mode-sections
      '((org-roam-backlinks-section :unique t)
        org-roam-reflinks-section))

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-roam file search
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun ak-org-roam-rg ()
  "Ripgrep search over `org-roam-directory` using Ivy/Counsel."
  (interactive)
  (require 'counsel)
  (counsel-rg nil "~/org/notes/"))

(global-set-key (kbd "C-c n /") #'ak-org-roam-rg)
