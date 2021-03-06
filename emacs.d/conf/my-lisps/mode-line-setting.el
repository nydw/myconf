;; -*-

;; Time-stamp: <2010-04-05 22:31:54 Monday by ahei>


(defun mode-line-face-settings ()
  "Face settings for `mode-line'."
  (custom-set-faces
    '(mode-line-buffer-id
       ((((class grayscale) (background light)) (:foreground "LightGray" :background "yellow" :weight bold))
        (((class grayscale) (background dark)) (:foreground "DimGray" :background "yellow" :weight bold))
        (((class color) (min-colors 88) (background light)) (:foreground "Orchid" :background "yellow"))
        (((class color) (min-colors 88) (background dark)) (:foreground "yellow" :background "HotPink3"))
        (((class color) (min-colors 16) (background light)) (:foreground "Orchid" :background "yellow"))
        (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue" :background "yellow"))
        (((class color) (min-colors 8)) (:foreground "blue" :background "yellow" :weight bold))
        (t (:weight bold)))))
  (if window-system
    (progn
      (set-face-foreground 'mode-line "black")
      (set-face-background 'mode-line "lightgreen")
      (set-face-background 'mode-line-inactive "white")
      (set-face-foreground 'mode-line-buffer-id "blue")
      (set-face-foreground 'mode-line-inactive "white")))

  (custom-set-faces
    '(header-line
       ((default
          :inherit mode-line)
        (((type tty))
         :foreground "black" :background "yellow" :inverse-video nil)
        (((class color grayscale) (background light))
         :background "grey90" :foreground "grey20" :box nil)
        (((class color grayscale) (background dark))
         :background "#D58EFFFFFC18" :foreground "blue")
        (((class mono) (background light))
         :background "white" :foreground "black"
         :inverse-video nil
         :box nil
         :underline t)
        (((class mono) (background dark))
         :background "black" :foreground "white"
         :inverse-video nil
         :box nil
         :underline t)))))

(eval-after-load "mode-line-settings"
                 '(progn
                    (defface mode-line-lines-face
                             '((((type tty pc)) :background "red" :foreground "white")
                               (t (:background "dark slate blue" :foreground "yellow")))
                             "Face used to highlight lines on mode-line.")))

(eval-after-load "faces"
                 `(mode-line-face-settings))

(provide 'mode-line-setting)

