
(require 'taglist)
(require 'xcscope)
(require 'cedet)
(require 'which-func-setting)

(setq c-default-style '((c-mode . "k&r") (other . "gnu")))    
(setq c-basic-offset 4)    


(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                   global-semanticdb-minor-mode
                                   global-semantic-idle-summary-mode
                                   global-semantic-mru-bookmark-mode))
(semantic-mode 1)








(provide 'c-setting)



