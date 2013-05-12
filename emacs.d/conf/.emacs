;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-11-03 17:45:59 Wednesday by taoshanwen>

(defconst my-emacs-path           "~/.emacs.d/conf/" "config file path")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "priv config file path")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "download config file path")
(defconst my-emacs-templates-path (concat my-emacs-path "lisps/template/templates/") "Path for templates")

(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)

(require 'eval-after-load)
(require 'start-setting)
(require 'little-setting)
(require 'dev-settings)
(require 'face-settings)
(require 'undo-tree)
(global-undo-tree-mode)
(require 'key-map)
(require 'evil)
(evil-mode 1)






