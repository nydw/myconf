;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-11-03 17:45:59 Wednesday by taoshanwen>

(defconst my-emacs-path           "~/emacs/" "相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "私有包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "下载的包的路径")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "代码模版")

;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)

;; 基本的小函数
(require 'ahei-misc)
(require 'eval-after-load)
(require 'util)
(require 'misc-settings)
(require 'edit-settings)
(require 'coding-settings)

;; CUA的矩阵区域操作
(require 'cua-settings)

;; 矩形区域操作
(require 'rect-mark-settings)

;; 鼠标配置
(require 'mouse-settings)

;; mark的一些设置
(require 'mark-settings)

;; `mode-line'显示格式
(require 'mode-line-settings)

;; ffap,打开当前point的文件
(require 'ffap-settings)

;; 各种语言开发方面的设置
(require 'dev-settings)

;;关闭工具栏
(if (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; 所有关于buffer方面的配置
(require 'all-buffer-settings)

;; 给出可选的命令名提示
(require 'icomplete-settings)

;; 输入部分命令就可以使用补全
(unless is-after-emacs-23
  (partial-completion-mode 1))

;; 很大的kill ring
(setq kill-ring-max 200)

;; 在kill-ring里寻找需要的东西
(require 'browse-kill-ring-settings)

;; 显示行号
(require 'linum-settings)

;; color theme Emacs主题
(require 'color-theme-settings)
(require 'ahei-face)
(require 'color-theme-ahei)
(require 'face-settings)

;; 高亮当前行
;;(require 'hl-line-settings)

;; 字体配置
(require 'font-settings)

;; diff
(require 'diff-settings)

;; Emacs的diff: ediff
(require 'ediff-settings)

;; 最近打开的文件
(require 'recentf-settings)

;; 在buffer中方便的查找字符串
(require 'moccur-settings)

;; Emacs超强的增量搜索Isearch配置
(require 'isearch-settings)

;; 在文件头记录修改时间, 并动态更新
(require 'time-stamp-settings)

(require 'apropos-settings)
(require 'completion-list-mode-settings)

;; 显示ascii表
(require 'ascii)

;; 所有关于查看帮助方面的配置
(require 'all-help-settings)

;; 简写模式
(setq-default abbrev-mode t)
(setq save-abbrevs nil)

;; Emacs的超强文件管理器
(require 'dired-settings)

;;view-mode的配置
(require 'view-mode-settings)

;; 增加更丰富的高亮
(require 'generic-x)

;; grep的设置
(require 'grep-settings)
(require 'full-ack-settings)

;; 返回到最近去过的地方
(require 'recent-jump-settings)


;; 编辑远程主机文件
(require 'tramp-settings)

;; Emacs中的包管理器
(require 'package)
(package-initialize)

;; 关闭时更新emacs.changed文件
(unless mswin (defun install-.emacs () (interactive)
(shell-command (concat my-emacs-path "install.emacs.sh")))
(add-hook 'kill-emacs-hook 'install-.emacs))

;; 在Emacs里面使用shell
(require 'term-settings)
(require 'multi-term-settings)

;; (require 'anything-settings)

(require 'ioccur)


;; 把光标由方块变成一个小长条
(require 'bar-cursor)

;; 启动Emacs的时候最大化Emacs
(require 'maxframe-settings)

(defun dos2unix ()
  "dos2unix on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'unix))

(defun unix2dos ()
  "unix2dos on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'dos))

;; 智能的改变光标形状
(require 'cursor-change)
(cursor-change-mode 1)

;; 模拟vi的点(.)命令
(require 'dot-mode)

;; 用渐变颜色显示你最近的修改
(require 'highlight-tail-settings)

;; 大纲mode
(require 'outline-settings)

;; 文本画图的工具         
(require 'artist-settings)

;; 默认工作目录
(if mswin (setq default-directory "d:/workspace/"))
(unless mswin (setq default-directory "~/workspace/")) 

;; 重新定义C代码格式
(setq c-default-style '((c-mode . "k&r") (other . "gnu")))
(setq c-basic-offset 8)

;; 输入法 
;;(require 'ibus)
;;(add-hook 'after-init-hook 'ibus-mode-on)

;;重新定义窗口切换
(require 'switch-window)

;; 切换主模式    
(require 'something-settings)

;; redo和undo
(require 'undo-tree)

;; 模拟vim模式
(require 'evil)

;; 缩略图
(require 'minimap)

;;服务模式
(server-start)


