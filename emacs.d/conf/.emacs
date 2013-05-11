;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-11-03 17:45:59 Wednesday by taoshanwen>

(defconst my-emacs-path           "~/.emacs.d/conf/" "config file path")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "priv config file path")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "download config file path")

(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)

(require 'eval-after-load)
(require 'start-setting)
(require 'little-setting)
(require 'face-settings)
(require 'c-setting)
(require 'key-map)
(require 'undo-tree)
(require 'evil)
(evil-mode 1)




(global-undo-tree-mode)


