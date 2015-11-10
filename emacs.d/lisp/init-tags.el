;; init-tags.el

(add-hook 'after-save-hook 'my-auto-update-tags-when-save)
(add-hook 'js2-mode-hook 'my-setup-develop-environment)
(add-hook 'web-mode-hook 'my-setup-develop-environment)
;(add-hook 'c++-mode-hook 'my-setup-develop-environment)
;(add-hook 'c-mode-hook 'my-setup-develop-environment)
(add-hook 'ruby--mode-hook 'my-setup-develop-environment)

(provide 'init-tags)
