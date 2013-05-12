;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-10 20:11:26 Saturday by ahei>

(require 'template)

(defun template-settings ()
  "settings for `template'."
  (setq template-default-directories (list (concat my-emacs-path "/templates/")))

  (defvar last-template nil "????ʹ?õ?ģ???ļ?")

  (defun my-template-expand-template (template)
    "չ??template??ģ???ļ?"
    (interactive
     (list
      (read-file-name
       (if last-template (format "??ָ??ģ???ļ?(ȱʡΪ%s): " last-template) "??ָ??ģ???ļ?: ")
       (concat my-emacs-path "templates") last-template t)))
    (template-expand-template template)
    (setq last-template template)))

(eval-after-load "template"
  `(template-settings))

(template-initialize)

(provide 'template-settings)
