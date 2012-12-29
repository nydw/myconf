;; Copyright (C) 2010 ahei

;; Author: ahei <ahei0802@gmail.com>
;; URL: http://code.google.com/p/dea/source/browse/trunk/my-lisps/ecb-settings.el
;; Time-stamp: <2010-04-10 15:59:33 Saturday by ahei>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

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
              (if fn (format "切换major-mode为(缺省为%s): " fn) "切换major mode为: ")
              obarray 'major-mode-heuristic t nil nil (symbol-name fn)))
      (list (intern val))))
  (let ((last-mode major-mode))
    (funcall mode)
    (setq switch-major-mode-last-mode last-mode)))


(defun get-mode-name ()
  "显示`major-mode'及`mode-name'"
  (interactive)
  (message "major-mode为%s,  mode-name为%s" major-mode mode-name))


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

(global-set-key [(control c) (|)] 'toggle-window-split)

(provide 'somethings)
