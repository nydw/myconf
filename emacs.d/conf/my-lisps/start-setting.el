;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-08-28 22:38:00 Saturday by taoshanwen>


(defalias 'move-beginning-of-line 'beginning-of-line)
(defalias 'move-end-of-line       'end-of-line)

;;PATH
;(setq exec-path (append exec-path '("/usr/texbin" "/opt/local/bin")))
(require 'exec-path-from-shell) 
(exec-path-from-shell-initialize)


(defun am-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS 
  use arguments FUNCTION, APPEND, LOCAL.
  HOOKS can be one list or just a hook."
  (if (listp hooks)
    (mapc
      `(lambda (hook)
         (add-hook hook ',function append local))
      hooks)
    (add-hook hooks function append local)))

(defun am-intern (&rest strings)
  "`intern' use STRINGS."
  (intern
    (apply
      'concat
      (mapcar
        (lambda (element)
          (if (stringp element) element (symbol-name element)))
        strings))))

(defun am-variable-is-t (symbol)
  "Return SYMBOL's value is t or not."
  (and (boundp symbol) (symbol-value symbol)))

(defmacro am-def-active-fun (symbol &optional fun-name)
  "Make definition of function 
  judge variable is active or not."
  `(defun ,(if fun-name fun-name symbol) ()
     ,(concat "`" (symbol-name symbol) "' is t or not.")
     (am-variable-is-t ',symbol)))

(defun apply-args-list-to-fun (fun-list args-list)
  "Apply args list to function FUN-LIST.
  FUN-LIST can be a symbol, also can be a list whose element is a symbol."
  (let ((is-list (and (listp fun-list) (not (functionp fun-list)))))
    (dolist (args args-list)
      (if is-list
        (dolist (fun fun-list)
          (apply-args-to-fun fun args))
        (apply-args-to-fun fun-list args)))))

;;;###autoload
(defun apply-args-to-fun (fun args)
  "Apply args to function FUN."
  (if (listp args)
    (eval `(,fun ,@args))
    (eval `(,fun ,args))))


;; 个人信息
(setq user-mail-address "myemail.com")
(setq user-full-name    "lgx")


(setq initial-frame-alist 
      '((top . 49)(left . 360)(width . 160)(height.60)))

(if window-system
  (setq default-frame-alist 
        (append 
          '((top . 49)(left . 360)(width . 160)(height . 60)) 
          default-frame-alist)))

;; 在fringe上显示一个小箭头
(setq-default indicate-buffer-boundaries 'mininal)

;; 尽快显示按键序列
(setq echo-keystrokes 0.1)

(setq system-time-locale "C")

;; 不要滚动条
(customize-set-variable 'scroll-bar-mode nil)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; 缺省使用text-mode
;;(setq default-major-mode 'text-mode)

;; 显示列号
(setq column-number-mode t)

;; emacs lock
(autoload 'toggle-emacs-lock 
          "emacs-lock" "Emacs lock" t)

;; 启用以下功能
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; 不显示Emacs的开始画面
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; yes or no, 用y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; 不要闪烁光标
(blink-cursor-mode -1)

;; 防止页面滚动时跳动
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 没有提示音,也不闪屏
(setq ring-bell-function 'ignore)

;; 可以递归的使用minibuffer
(setq enable-recursive-minibuffers t)

;; 加密显出你的密码
(add-hook 'comint-output-filter-functions 
          'comint-watch-for-password-prompt)

;; 保存你上次光标所在的位置
(require 'saveplace)
(setq-default save-place t)

;; 光标靠近鼠标指针时，自动让开
(mouse-avoidance-mode 'animate)

;; 不保存连续的重复的kill
(setq kill-do-not-save-duplicates t)

;; 先格式化再补全
(setq tab-always-indent 'complete)

(setq frame-title-format 'buffer-file-name)    

(setq default-directory "~/workspace/")     

(require 'autopair-setting)



(provide 'start-setting)





