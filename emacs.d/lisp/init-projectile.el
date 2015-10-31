;; init-projectile.el

(require 'projectile)

;; global mode
(projectile-global-mode)
;; enable caching
(setq projectile-enable-caching t)
;; set completion system
(setq projectile-completion-system 'helmo)
;; enable helm-projectile
(helm-projectile-on)
;; 设置查找文件快捷键
;(global-set-key (kbd "C-x p") 'projectile-find-file)

(provide 'init-projectile)
