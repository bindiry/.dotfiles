(require 'package)
;; 添加插件来源
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; 包初始化
(package-initialize)

(tool-bar-mode 0) ;;不显示工具栏
(menu-bar-mode 0) ;;不现实菜单栏
(scroll-bar-mode 0) ;;不显示滚动条
(global-linum-mode 1) ;;显示行号与列号
(column-number-mode 1)
(setq inhibit-startup-message 1) ;;关闭启动动画
(setq default-directory "~/workspace") ;;设置初始工作目录
(fset 'yes-or-no-p 'y-or-n-p) ;;设置问答提示为 y-or-n,而不是yes-or-no
(setq make-backup-files nil) ;;不生成备份文件，即 xxx.xx~ 类文件
(add-to-list 'default-frame-alist '(width . 180)) ;; 默认窗口大小
(add-to-list 'default-frame-alist '(height . 40))
(load-theme 'atom-one-dark t) ;; 使用主题
(set-default-font "M+ 2m-16") ;; 默认字体
