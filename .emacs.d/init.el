;; init.el

;; 将目录lisp/添加到搜索路径中
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 初始化ELPA
(require 'init-elpa)
;; 初始化一般配置
(require 'init-general)
