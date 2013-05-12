;; face-setting 外观配置


;;(color-theme-myself)
(require 'color-theme) 
(color-theme-initialize)
(color-theme-myself)




(require 'font-setting)
(require 'stripes-setting)
(require 'linum-setting)
(require 'alpha-window)
(require 'switch-window)
(require 'highlight-parentheses)

(define-globalized-minor-mode global-highlight-parentheses-mode
                              highlight-parentheses-mode
                              (lambda ()
                                (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode 1)
(setq hl-paren-colors '("Red" "Cyan" "Brown" "Orange" "Magenta" "Green" "purple" "Red"))

(fringe-mode 1)
(setq fringe-mode 'half-width)
(require 'mode-line-setting)


(provide 'face-settings)

