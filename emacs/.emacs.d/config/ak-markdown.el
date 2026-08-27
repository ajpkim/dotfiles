;;; ak-markdown.el --- Markdown configuration -*- lexical-binding: t -*-
(provide 'ak-markdown)

(use-package markdown-ts-mode
  :ensure nil
  :mode ("\\.md\\'" "\\.mdx\\'" "\\.markdown\\'")
  :config
  (require 'markdown-ts-mode-x))
