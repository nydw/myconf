;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-28 13:32:49 Wednesday by ahei>

(require 'linum)
(require 'linum+)


(defun linum-face-setting ()
  "Face settings for `linum'."
  (custom-set-faces
   '(linum
     ((((background "white"))
       :foreground "cyan")))))
;;      (t :foreground "green")))))



(am-add-hooks
  `(find-file-hook help-mode-hook Man-mode-hook log-view-mode-hook chart-mode-hook
                   compilation-mode-hook gdb-mode-hook lisp-interaction-mode-hook
                   browse-kill-ring-mode-hook completion-list-mode-hook hs-hide-hook
                   inferior-ruby-mode-hook custom-mode-hook Info-mode-hook svn-log-edit-mode-hook
                   package-menu-mode-hook dired-mode-hook apropos-mode-hook svn-log-view-mode-hook
                   diff-mode-hook emacs-lisp-mode-hook ibuffer-mode-hook html-mode-hook
                   w3m-mode-hook data-debug-hook debugger-mode-hook text-mode-hook color-theme-mode-hook
                   semantic-symref-results-mode-hook sh-mode-hook groovy-mode-hook)
  (lambda()
    (unless (eq major-mode 'image-mode)
      (linum-mode 1))))

(defun linum-setting ()
  "settings for `linum'.")


(eval-after-load 'linum
  `(linum-face-setting))

(eval-after-load 'linum
  `(linum-setting))



(provide 'linum-setting)
