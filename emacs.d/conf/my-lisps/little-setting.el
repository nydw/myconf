;;; ahei-misc.el --- Some basic utility function of ahei
;; -*- Emacs-Lisp -*-


;;; Code:

;;;###autoload
(defun forward-to-word (arg)
  "Move forward until encountering 
  the beginning of a word. With argument,  
  do this that many times."
  (interactive "p")
  (or (re-search-forward (if (> arg 0) 
                           "\\W\\b" "\\b\\W") nil t arg)
      (goto-char (if (> arg 0) (point-max) (point-min)))))

(defun backward-to-word (arg)
  "Move backward until encountering 
  the end of a word. With argument,  
  do this that many times."
  (interactive "p")
  (forward-to-word (- arg)))

(defun am-forward-word-or-to-word ()
  "`forward-word' or `forward-to-word'.
  If after excute `forward-to-word', 
  current position is at next line, 
  then rollback and excute `forward-word'"
  (interactive)
  (let ((noo (line-number-at-pos)) no)
    (save-excursion
      (forward-to-word 1)
      (setq no (line-number-at-pos)))
    (if (> no noo)
      (forward-word)
      (forward-to-word 1))))

;;;###autoload
(defmacro am-with-temp-mode (mode &rest body)
  "Create a temporary buffer with mode MODE, 
  and evaluate BODY there like `progn'.
  See also `with-temp-buffer'."
  `(with-temp-buffer
     (funcall ,mode)
     ,@body))

;;;###autoload
(defun am-equal-ignore-case (str1 str2)
  "STR1 equal ignore case to STR2 or not."
  (string= (downcase str1) (downcase str2)))


(defvar switch-major-mode-last-mode nil)

(defun major-mode-heuristic (symbol)
  (and (fboundp symbol)
       (string-match ".*-mode$" (symbol-name symbol))))

(defun switch-major-mode (mode)
  "切换major mode"
  (interactive
    (let ((fn switch-major-mode-last-mode) val)
      (setq val
            (completing-read
              (if fn (format "切换major-mode为(缺省%s): " fn) 
                "切换major-mode为: ")
              obarray 'major-mode-heuristic 
              t nil nil (symbol-name fn)))
      (list (intern val))))
  (let ((last-mode major-mode))
    (funcall mode)
    (setq switch-major-mode-last-mode last-mode)))


(defun get-mode-name ()
  "显示`major-mode'及`mode-name'"
  (interactive)
  (message "major-mode为%s,  
           mode-name为%s" major-mode mode-name))


(defun switch-to-scratch ()
  "切换到*scratch*"
  (interactive) 
  (let ((buffer (get-buffer-create "*scratch*")))
    (switch-to-buffer buffer)
    (unless (equal major-mode 'lisp-interaction-mode)
      (lisp-interaction-mode))))

;;横切变竖切，竖切边横切
(defun toggle-window-split ()
  "Vertical split shows more of each line,  horizontal split shows
  more lines. This code toggles between them. It only works for
  frames with exactly two windows."
  (interactive)
  (if (= (count-windows) 2)
    (let* ((this-win-buffer (window-buffer))
           (next-win-buffer (window-buffer (next-window)))
           (this-win-edges (window-edges (selected-window)))
           (next-win-edges (window-edges (next-window)))
           (this-win-2nd (not (and (<= (car this-win-edges)
                                       (car next-win-edges))
                                   (<= (cadr this-win-edges)
                                       (cadr next-win-edges)))))
           (splitter
             (if (= (car this-win-edges)
                    (car (window-edges (next-window))))
               'split-window-horizontally
               'split-window-vertically)))
      (delete-other-windows)
      (let ((first-win (selected-window)))
        (funcall splitter)
        (if this-win-2nd (other-window 1))
        (set-window-buffer (selected-window) this-win-buffer)
        (set-window-buffer (next-window) next-win-buffer)
        (select-window first-win)
        (if this-win-2nd (other-window 1))))))


;; 调节行间距
(defun toggle-line-spacing () 
"Toggle line spacing between 1 and 5 pixels." 
(interactive) 
(if (eq line-spacing 1) 
(setq-default line-spacing 7) 
(setq-default line-spacing 1)))







(provide 'little-setting)















