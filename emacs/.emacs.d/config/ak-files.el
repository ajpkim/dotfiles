;; Quick access to high use files.
;; See for details on keybinding: https://www.masteringemacs.org/article/mastering-key-bindings-emacs

(provide 'ak-files)

(defun ak-file-shortcut (file)
  "Open given FILE in current frame or new frame if invoked with prefix arg."
  (interactive)
  (if (file-exists-p file)
      (if (equal current-prefix-arg nil)
          (find-file file)
        (find-file-other-frame file))))

(global-set-key (kbd "C-c f a") (lambda () (interactive) (ak-file-shortcut "~/org/anki.org")))
(global-set-key (kbd "C-c f L") (lambda () (interactive) (ak-file-shortcut "~/org/log.org")))
(global-set-key (kbd "C-c f l") (lambda () (interactive) (ak-file-shortcut "~/org/lists.org")))
(global-set-key (kbd "C-c f n") (lambda () (interactive) (ak-file-shortcut "~/org/notes/inbox.org")))
(global-set-key (kbd "C-c f t") (lambda () (interactive) (ak-file-shortcut "~/org/todo.org")))
(global-set-key (kbd "C-c f P") (lambda () (interactive) (ak-file-shortcut "~/org/passtur/passtur.org")))
(global-set-key (kbd "C-c f p") (lambda () (interactive) (ak-file-shortcut  "~/org/projects.org")))
(global-set-key (kbd "C-c f W") (lambda () (interactive) (ak-file-shortcut "~/org/passtur/passtur-log.org")))
