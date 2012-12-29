;; myself config 

(require 'util)
(require 'ahei-misc)
(require 'alpha-window)
(require 'switch-window)
(require 'somethings)
(require 'minimap)
(require 'eval-after-load)
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
                              highlight-parentheses-mode
                              (lambda ()
                                (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
(setq hl-paren-colors '("red" "yellow" "cyan" "magenta" "green" "red"))

(require 'init-fonts)


