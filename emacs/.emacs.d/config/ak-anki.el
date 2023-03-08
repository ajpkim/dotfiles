\;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Anki editing in Emacs
;; Sources:
;; https://yiufung.net/post/anki-org/
;; https://github.com/yiufung/dot-emacs/blob/master/init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-anki)

;; FROM BLOGPOST
(use-package anki-editor
  :ensure t
  :after org
  :bind (:map org-mode-map
              ("<f12>" . anki-editor-cloze-region-auto-incr)
              ("<f11>" . anki-editor-cloze-region-dont-incr)
              ("<f10>" . anki-editor-reset-cloze-number)
              ("<f9>"  . anki-editor-push-tree))
  :hook (org-capture-after-finalize . anki-editor-reset-cloze-number) ; Reset cloze-number after each capture.
  :config
  (setq anki-editor-create-decks t ;; Allow anki-editor to create a new deck if it doesn't exist
        anki-editor-org-tags-as-anki-tags t)

  (defun anki-editor-cloze-region-auto-incr (&optional arg)
    "Cloze region without hint and increase card number."
    (interactive)
    (anki-editor-cloze-region my-anki-editor-cloze-number "")
    (setq my-anki-editor-cloze-number (1+ my-anki-editor-cloze-number))
    (forward-sexp))
  (defun anki-editor-cloze-region-dont-incr (&optional arg)
    "Cloze region without hint using the previous card number."
    (interactive)
    (anki-editor-cloze-region (1- my-anki-editor-cloze-number) "")
    (forward-sexp))
  (defun anki-editor-reset-cloze-number (&optional arg)
    "Reset cloze number to ARG or 1"
    (interactive)
    (setq my-anki-editor-cloze-number (or arg 1)))
  (defun anki-editor-push-tree ()
    "Push all notes under a tree."
    (interactive)
    (anki-editor-push-notes '(4))
    (anki-editor-reset-cloze-number))
  ;; Initialize
  (anki-editor-reset-cloze-number)
  )

;; Fix for bug pushing notes: https://github.com/louietan/anki-editor/issues/76
(defun anki-editor--anki-connect-invoke! (orig-fun &rest args)
    (let ((request--curl-callback
           (lambda (proc event) (request--curl-callback "localhost" proc event))))
      (apply orig-fun args)))

(advice-add 'anki-editor--anki-connect-invoke :around #'anki-editor--anki-connect-invoke!)
