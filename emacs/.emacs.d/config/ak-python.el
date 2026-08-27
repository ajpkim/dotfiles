;;; ak-python.el --- Python configuration -*- lexical-binding: t -*-
(provide 'ak-python)

(use-package python-ts-mode
  :hook
  ((python-ts-mode . eglot-ensure)
   (python-ts-mode . blacken-mode)
   (python-ts-mode . (lambda () (setq tab-width 4))))
  :mode (("\\.py\\'" . python-ts-mode)))

;; Formatter
(use-package blacken
  :ensure t
  :config
  (setq blacken-line-length 100)
)

;; Virtualenv activation (M-x pyvenv-activate / pyvenv-workon).
;; Sets VIRTUAL_ENV + prepends PATH/exec-path *inside this Emacs process*,
;; which is what flycheck/eglot subprocesses actually see -- unlike
;; activating a venv in a terminal, which never reaches an already-running
;; daemon.
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1)

  (defun ak-python--find-venv (dir)
    "Return the nearest `venv'/`.venv' directory at or above DIR, or nil."
    (when-let* ((root (locate-dominating-file
                        dir
                        (lambda (d)
                          (or (file-directory-p (expand-file-name "venv" d))
                              (file-directory-p (expand-file-name ".venv" d)))))))
      (if (file-directory-p (expand-file-name "venv" root))
          (expand-file-name "venv" root)
        (expand-file-name ".venv" root))))

  (defun ak-python-auto-activate-venv ()
    "Activate the nearest project venv, if any, before eglot starts.
Added last among `python-ts-mode-hook' entries below so it runs
*first* (each `add-hook' call prepends), i.e. before `eglot-ensure'."
    (when-let* ((venv (ak-python--find-venv default-directory)))
      (unless (equal pyvenv-virtual-env (file-name-as-directory venv))
        (pyvenv-activate venv))))

  :hook (python-ts-mode . ak-python-auto-activate-venv))
