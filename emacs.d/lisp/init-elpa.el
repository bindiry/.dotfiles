;; init-elpa.el

(require 'package)
;; 添加插件来源
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; 包初始化
(package-initialize)
(provide 'init-elpa)
