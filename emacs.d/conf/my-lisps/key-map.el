
(global-set-key [(control c) (|)] 'toggle-window-split)
(global-set-key (kbd "<C-f11>") 'toggle-line-spacing) 
(global-set-key (kbd "M-f") 'forward-to-word)
(global-set-key (kbd "M-b") 'backward-to-word)
(global-set-key (kbd "C-M-=") 'increase-default-font-height)
(global-set-key (kbd "C-M--") 'decrease-default-font-height)
(global-set-key (kbd "M-/") 'hippie-expand)

;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'

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









(provide 'key-map)
