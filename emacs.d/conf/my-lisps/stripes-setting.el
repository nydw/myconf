
(require 'stripes)


(am-add-hooks
  `(

    lisp-interaction-mode-hook 
    emacs-lisp-mode-hook
    c-mode-common-hook 
    pyhon-mode-hook
    text-mode-hook
    lisp-mode-hook 
    java-mode-hook 
    ruby-mode-hook
    awk-mode-hook
    sh-mode-hook

    )

  'turn-on-stripes-mode)




(provide 'stripes-setting)
