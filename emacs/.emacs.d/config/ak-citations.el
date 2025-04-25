;; Citation related tools that integrate with Zotero and org-roam,
;; specifically the "ref" notes in org-roam. Zotero must be running
;; for some features.

(provide 'ak-citations)

;; (require 'citar)
(require 'oc-basic)
(require 'oc-basic)
(require 'oc-biblatex)
(require 'oc-csl)

(use-package citar
  :ensure t
  :no-require
  :custom
  (org-cite-global-bibliography '("~/org/notes/refs.bib"))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  ;; optional: org-cite-insert is also bound to C-c C-x C-@
  :bind
  (:map org-mode-map :package org ("C-c b" . #'org-cite-insert)))


(set-face-attribute 'org-cite nil :foreground "#00cc99")
(set-face-attribute 'org-cite-key nil :foreground "#00cc99")
