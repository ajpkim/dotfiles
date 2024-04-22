(provide 'ak-treesitter)

(require 'treesit)

(setq treesit-extra-load-path '("~/builds/tree-sitter-module/dist"))

(setq major-mode-remap-alist
      '((bash-mode . bash-ts-mode)
	(c-mode . c-ts-mode)
	(css-mode . css-ts-mode)
	(dockerfile-mode . dockerfile-ts-mode)
	(js-mode . js-ts-mode)  ;; Doesn't work...?
	(json-mode . json-ts-mode)
	(python-mode . python-ts-mode)
	(typescript-mode . typescript-ts-mode)
	(yaml-mode . yaml-ts-mode)))

;; ;; Explicit hooks here since the major-mode-remap doesn't work for JS modes...
(add-hook 'js-mode-hook 'js-ts-mode)
