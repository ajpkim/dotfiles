(provide 'ak-modeline)

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1)
;;   :custom-face
;;   (mode-line ((t (:height 1.0))))
;;   (mode-line-inactive ((t (:height 0.75))))
;;   :custom
;;   ((doom-modeline-height 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hidden modeline mode
;; src: https://bzg.fr/en/emacs-hide-mode-line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar-local hidden-mode-line-mode nil)
(define-minor-mode ak-hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global t
  :variable hidden-mode-line-mode
  ;; :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "My Hidden Mode Line Mode enabled.  "
             "Use M-x ak-hidden-mode-line-mode to make the mode-line appear as before."))))


(global-set-key (kbd "C-c h m") 'ak-hidden-mode-line-mode)
