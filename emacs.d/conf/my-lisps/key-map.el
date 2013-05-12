
(global-set-key [(control c) (|)] 'toggle-window-split)
(global-set-key (kbd "<C-f11>") 'toggle-line-spacing) 
(global-set-key (kbd "M-f") 'forward-to-word)
(global-set-key (kbd "M-b") 'backward-to-word)
(global-set-key (kbd "C-M-=") 'increase-default-font-height)
(global-set-key (kbd "C-M--") 'decrease-default-font-height)
(global-set-key (kbd "M-/") 'hippie-expand)


(eal-define-keys 'ac-complete-mode-map
                 `(("<return>" nil) 
                   ("RET" nil) ("M-j" ac-complete)))

(eal-define-keys
  '(emacs-lisp-mode-map 
     c-mode-base-map 
     makefile-mode-map 
     makefile-automake-mode-map
     sh-mode-map text-mode-map)
  `(("C-c T" my-template-expand-template)
    ("C-c C-t" template-expand-template)))


(eal-define-keys
 'yas/keymap
 `(("M-j"     yas/next-field-or-maybe-expand)
   ("M-k"     yas/prev-field)))

(eal-define-keys
 'yas/minor-mode-map
 `(("C-c C-f" yas/find-snippets)))

(define-key company-mode-map (kbd "M-RET") 'company-expand-top)






(provide 'key-map)
