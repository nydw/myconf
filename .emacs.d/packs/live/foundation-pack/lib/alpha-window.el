;; transform window 
;; Anchor: March Liu (刘鑫) <march....@gmail.com> 
;; 
;; This is a script to set emacs window's alpha value. 
;; It work well on windows xp and vista with EmacsWin32 
;; useage: add below line in your .emacs 
;; 
;; (load-file "path/alpha-window.el") 
;; 
;; you can define your alpha-list to set the transform combine 
;; bind key with below code: 
;; 

;;;; 设置窗体透明
;;  (global-set-key [(f12)] 'loop-alpha) 
;;  (setq alpha-list '((72 49) (100 100)))    
;;  (defun loop-alpha ()    
;;   (interactive)    
;;   (let ((h (car alpha-list)))                    
;;    ((lambda (a ab)    
;;       (set-frame-parameter (selected-frame) 'alpha (list a ab))    
;;       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))    
;;       ) (car h) (car (cdr h)))    
;;    (setq alpha-list (cdr (append alpha-list (list h))))    
;;    )    
;;  )    
;;

(global-set-key [(f12)] 'loop-alpha) 

(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35))) 

(defun loop-alpha () 
  (interactive) 
  (let ((h (car alpha-list)))                ;; head value will set to 
    ((lambda (a ab) 
       (set-frame-parameter (selected-frame) 'alpha (list a ab)) 
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab))) 
       ) (car h) (car (cdr h))) 
    (setq alpha-list (cdr (append alpha-list (list h)))) 
    ) 
) 


(provide 'alpha-window)
