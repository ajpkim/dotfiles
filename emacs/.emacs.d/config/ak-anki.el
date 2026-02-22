;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Anki editing in Emacs
;; Inspiration sources
;; https://yiufung.net/post/anki-org/
;; https://github.com/yiufung/dot-emacs/blob/master/init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ak-anki)

(use-package anki-editor
  :ensure t
  :after org
  :config
  (add-hook 'find-file-hook
	    (lambda ()
	      (when (and buffer-file-name
			 (file-equal-p (expand-file-name buffer-file-name) (expand-file-name "~/org/anki.org")))
		(anki-editor-mode 1)))))


(defvar ak/anki-map (make-sparse-keymap)
  "Keymap for anki-editor commands under `C-c v`.")

(define-key global-map (kbd "C-c v") ak/anki-map)

(define-key ak/anki-map (kbd "p") #'anki-editor-push-notes)
(define-key ak/anki-map (kbd "n") #'anki-editor-push-new-notes)
(define-key ak/anki-map (kbd "c") #'anki-editor-cloze-dwim)
(define-key ak/anki-map (kbd "?") #'anki-editor-api-check)
