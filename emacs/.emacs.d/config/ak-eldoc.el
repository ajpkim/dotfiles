;;; ak-eldoc.el --- Eldoc configuration -*- lexical-binding: t -*-
(provide 'ak-eldoc)

;; `eldoc-box' pops docs up in a GUI child frame. TTYs have no equivalent,
;; so under `emacs -nw' (e.g. multiple terminal frames on one daemon) the
;; popup can render on the wrong frame and steal the selected window until
;; the buffer is killed. Only enable it on graphical frames; terminal
;; frames fall back to plain eldoc (echo area / doc buffer).
(defun ak-eldoc-box-maybe-hover-mode ()
  (when (display-graphic-p)
    (eldoc-box-hover-mode 1)))

(use-package eldoc-box
  :ensure t
  :hook (eglot-managed-mode . ak-eldoc-box-maybe-hover-mode))
