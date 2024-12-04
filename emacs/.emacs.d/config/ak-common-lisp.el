(provide 'ak-common-lisp)

(use-package slime
  :ensure t
  :init
  ;; Path to your Lisp interpreter
  (defcustom my-lisp-interpreter "sbcl"
    "Path to the Lisp interpreter used by SLIME."
    :type 'string)
  (setq inferior-lisp-program my-lisp-interpreter)

  ;; Enable additional SLIME features
  (setq slime-contribs '(slime-fancy))

  :config
  ;; Load Quicklisp's SLIME helper if installed
  (let ((quicklisp-helper (expand-file-name "~/quicklisp/slime-helper.el")))
    (when (file-exists-p quicklisp-helper)
      (load quicklisp-helper))))
