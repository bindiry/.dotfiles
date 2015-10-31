;; init-company.el

(require 'company)

;; use company in all buffers
(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends)
)

(provide 'init-company)
