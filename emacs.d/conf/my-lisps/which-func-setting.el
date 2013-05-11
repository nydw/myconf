

(which-func-mode 1)

(defun which-func-settings ()
  "Settings for `which-func'."
  (setq which-func-unknown "unknown"))

(eval-after-load "which-func"
                 `(which-func-settings))


(defun which-func-face-settings ()
  "Face settings for `which-func'."
  (if window-system
    (progn
        (set-face-foreground 'which-func "yellow2")
        (set-face-background 'which-func "dark magenta"))
      (set-face-foreground 'which-func "yellow")
      (set-face-background 'which-func "black")))

(eval-after-load "which-func"
                 `(which-func-face-settings))

(provide 'which-func-setting)

