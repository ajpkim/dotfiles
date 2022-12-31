(provide 'ak-focus-mode)

(define-minor-mode ak-scroll-center-cursor-mode
  "Toggle center cursor scrolling behavior"
  :init-value nil
  :lighter " S="
  :global nil
  (if ak-scroll-center-cursor-mode
      (setq-local scroll-preserve-screen-position t
                  scroll-conservatively 0
                  maximum-scroll-margin 0.5
                  scroll-margin 99999)
    (setq-local scroll-preserve-screen-position nil
                scroll-conservatively 100
                maximum-scroll-margin 0.25
                scroll-margin 0)))

(define-minor-mode ak-focus-mode
  "Focused reading and editing env"
  :init-value nil
  :global nil
  (if ak-focus-mode
      (progn
        (blink-cursor-mode -1)
        (olivetti-mode 1)
        (ak-scroll-center-cursor-mode 1)
	(display-line-numbers-mode -1)
        (setq mode-line-format nil))
    (progn
      (blink-cursor-mode 1)
      (olivetti-mode -1)
      (ak-scroll-center-cursor-mode -1)
      (setq mode-line-format
            '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position (vc-mode vc-mode) "  " ...)))))


(global-set-key (kbd "C-c z") 'ak-focus-mode)
