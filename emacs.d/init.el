;; init.el

;; 将目录lisp/添加到搜索路径中
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; init ELPA
(require 'init-elpa)
;; init functions
(require 'init-functions)
;; init general
(require 'init-general)
;; init helm
(require 'init-helm)
;; init robe
(require 'init-robe)
;; init company
(require 'init-company)
;; init projectile
(require 'init-projectile)
;; init tags
;(require 'init-tags)
;; init markdown
(require 'init-markdown)

(provide 'init)
