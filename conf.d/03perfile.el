;;; 10editmodes.el --- customizations for various modes
;;;
;;; Time-stamp: <2025-04-24 14:40:05 azabiralov>
;;;
;;; Commentary:

;;; Code:


(require 'flycheck)

(use-package make-mode
  :defer t
  :config
  (setq makefile-tab-after-target-colon t
	makefile-browser-selected-mark "+   "
	makefile-browser-unselected-mark "   "))

(use-package sql
  :defer t
  :mode "\\.sql\\'")

(use-package sql-clickhouse :defer t)

(use-package shell :defer t)

(use-package cperl-mode
  :defer t
  :config
  (setq cperl-hairy nil
	cperl-indent-level 4
	cperl-auto-newline t
	cperl-electric-parens nil
	cperl-electric-lbrace-space nil))

(use-package cc-mode
  :defer t
  :config
  (setq c-basic-offset 4
	c-default-style "bsd"
	c-report-syntactic-errors t))



(use-package toml-mode :defer t)
(use-package json-mode :defer t)
(use-package dockerfile-mode :defer t)
(use-package docker-compose-mode :defer t)

(use-package yaml-mode
  :defer t
  :hook
  (yaml-mode-hook . yas-minor-mode))

(use-package jinja2-mode
  :defer t
  :mode "\\.j2\\'")

(use-package terraform-mode
  :defer t
  :mode "\\.tf\\'"
  :config
  (setq terraform-indent-level 4))


(use-package conf-mode
  :defer t
  :mode "\\.conf\\'"
  :mode "\\.cnf\\'"
  :mode "\\.cf\\'")

(use-package dns-mode
  :defer t
  :mode "\\.dns\\'"
  :mode "\\.bind\\'"
  :mode "\\.zone\\'"
  :config
  (setq dns-mode-soa-auto-increment-serial t))

(use-package hcl-mode
  :defer t
  :mode "\\.tpl\\'"
  :mode "\\.hcl\\'"
  :config
  (setq hcl-indent-level 4))

(use-package nginx-mode
  :defer t
  :config
  (setq nginx-indent-level 4
	nginx-indent-tabs-mode nil))

(use-package go-mode
  :defer t
  :config
  (setq go-fontify-function-calls t
	go-fontify-variables t))


;;; 03perfile.el ends here
