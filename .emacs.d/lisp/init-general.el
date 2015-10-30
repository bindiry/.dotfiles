;; init-general.el

;;不显示工具栏
(tool-bar-mode 0) 
;;不现实菜单栏
(menu-bar-mode 0)
;;不显示滚动条
(scroll-bar-mode 0)
;;显示行号与列号
(global-linum-mode 1)
(column-number-mode 1)
;;关闭启动动画
(setq inhibit-startup-message 1)
;;设置初始工作目录
(setq default-directory "~/workspace")
;;设置问答提示为 y-or-n,而不是yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)
;;不生成备份文件，即 xxx.xx~ 类文件
(setq make-backup-files nil)
;; 默认窗口大小
(add-to-list 'default-frame-alist '(width . 140))
(add-to-list 'default-frame-alist '(height . 30))
;; 使用主题
(load-theme 'atom-one-dark t)
;; Setting English Font
(set-face-attribute
 'default nil :font "M+ 2m 14")
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
            charset
            (font-spec :family "PingFang SC" :size 14)))

(provide 'init-general)
