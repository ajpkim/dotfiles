;;; ak-treesitter.el --- Tree-sitter configuration -*- lexical-binding: t -*-
(provide 'ak-treesitter)

(require 'treesit)

(setq treesit-language-source-alist
      '((bash       "https://github.com/tree-sitter/tree-sitter-bash")
        (c          "https://github.com/tree-sitter/tree-sitter-c")
        (css        "https://github.com/tree-sitter/tree-sitter-css")
        (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
        (go         "https://github.com/tree-sitter/tree-sitter-go")
        (gomod      "https://github.com/camdencheek/tree-sitter-go-mod")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
        (json       "https://github.com/tree-sitter/tree-sitter-json")
        (python     "https://github.com/tree-sitter/tree-sitter-python")
	(markdown     "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/src")
	(markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/src")
        (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml       "https://github.com/ikatyang/tree-sitter-yaml")))

(defun ak-treesit-install-all-grammars ()
  "Install every grammar in `treesit-language-source-alist' not already built."
  (interactive)
  (dolist (lang (mapcar #'car treesit-language-source-alist))
    (unless (treesit-language-available-p lang)
      (treesit-install-language-grammar lang))))

(ak-treesit-install-all-grammars)

(setq major-mode-remap-alist
      '((bash-mode       . bash-ts-mode)
        (c-mode          . c-ts-mode)
        (css-mode        . css-ts-mode)
        (dockerfile-mode . dockerfile-ts-mode)
        (go-mode         . go-ts-mode)
	(markdown-mode         . markdown-ts-mode)
        (json-mode       . json-ts-mode)
        (python-mode     . python-ts-mode)
        (yaml-mode       . yaml-ts-mode)))
