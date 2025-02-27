;;; 10editmodes.el --- customizations for various modes
;;;
;;; Time-stamp: <2024-10-17 02:45:44 azabiralov>
;;;
;;; Commentary:

;;; Code:


(require 'flycheck)

(use-package make-mode
  :config
  (setq makefile-tab-after-target-colon t
	makefile-browser-selected-mark "+   "
	makefile-browser-unselected-mark "   "))

(use-package sql
  :mode "\\.sql\\'")

(use-package sql-clickhouse)
(use-package shell)

(use-package cperl-mode
  :config
  (setq cperl-hairy nil
	cperl-indent-level 8
	cperl-auto-newline t
	cperl-electric-parens nil
	cperl-electric-lbrace-space nil))

(use-package cc-mode
  :config
  (setq c-basic-offset 8
	c-default-style "bsd"
	c-report-syntactic-errors t))

(use-package flycheck
  :config
  (setq  flycheck-gcc-language-standard "c17"
	 flycheck-gcc-pedantic t
	 flycheck-cppcheck-checks '("warning" "style" "information"))
  (add-to-list 'flycheck-gcc-include-path "~/src/include/"))


(use-package toml-mode)
(use-package json-mode)
(use-package dockerfile-mode)
(use-package docker-compose-mode)

(use-package yaml-mode
  :hook
  (yaml-mode-hook . yas-minor-mode))

(use-package jinja2-mode
  :mode "\\.j2\\'")

(use-package terraform-mode
  :mode "\\.tf\\'"
  :config
  (setq terraform-indent-level 2))


(use-package conf-mode
  :mode "\\.conf\\'"
  :mode "\\.cnf\\'"
  :mode "\\.cf\\'")

(use-package dns-mode
  :mode "\\.dns\\'"
  :mode "\\.bind\\'"
  :mode "\\.zone\\'"
  :config
  (setq dns-mode-soa-auto-increment-serial t))

(use-package hcl-mode
  :config
  (setq hcl-indent-level 8))

(use-package nginx-mode
  :config
  (setq nginx-indent-level 4
	nginx-indent-tabs-mode nil))

(use-package go-mode
  :config
  (setq go-fontify-function-calls t
	go-fontify-variables t))


;;; 03perfile.el ends here
