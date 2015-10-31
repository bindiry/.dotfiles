;; init-functions.el

;; http://www.emacswiki.org/emacs/download/misc-cmds.el
;; revert buffer
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(provide 'init-functions)
