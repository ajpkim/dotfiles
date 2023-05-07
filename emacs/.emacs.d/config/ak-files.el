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

(global-set-key (kbd "C-c f l") (lambda () (interactive) (ak-file-shortcut "~/org/life-log.org")))
(global-set-key (kbd "C-c f n") (lambda () (interactive) (ak-file-shortcut "~/org/notes/inbox.org")))
(global-set-key (kbd "C-c f t") (lambda () (interactive) (ak-file-shortcut "~/org/todo.org")))
