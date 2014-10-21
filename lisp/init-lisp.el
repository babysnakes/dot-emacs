;; Enable paredit for lisps
(dolist (mode '(scheme emacs-lisp lisp))
  (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
            'enable-paredit-mode))

(provide 'init-lisp)
