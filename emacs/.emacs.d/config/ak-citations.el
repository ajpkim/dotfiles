;; Citation related tools that integrate with Zotero and org-roam,
;; specifically the "ref" notes in org-roam.

(provide 'ak-citations)

(require 'citar)
(require 'oc-basic)
(require 'oc-basic)
(require 'oc-biblatex)
(require 'oc-csl)

(use-package citeproc
  :ensure t)

(use-package citar
  :ensure t
  ;; :bind (("C-c b" . citar-insert-citation)
  ;;        :map minibuffer-local-map
  ;;        ("M-b" . citar-insert-preset))
  :custom
  (citar-bibliography '("~/org/notes/refs.bib")))


(setq org-cite-export-processors '((t csl))  ;; can add a 3rd arg for a specific style file
      org-cite-global-bibliography '("~/org/notes/refs.bib"))

(set-face-attribute 'org-cite nil :foreground "#00cc99")
(set-face-attribute 'org-cite-key nil :foreground "#00cc99")
