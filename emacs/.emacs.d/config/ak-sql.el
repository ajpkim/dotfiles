;;; ak-sql.el --- SQL configuration -*- lexical-binding: t -*-
(provide 'ak-sql)

(use-package sql
  :mode ("\\.sql\\'" . sql-mode)
  :config
  (setq sql-product 'postgres))

(use-package sqlformat
  :ensure t
  :hook (sql-mode . sqlformat-on-save-mode)
  :config
  (setq sqlformat-command 'pgformatter)
  (setq sqlformat-args '("-s2")))
