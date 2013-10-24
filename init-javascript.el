;; Javascript stuff.

;; A module that combines js-mode, js2-mode and npm style indentation.
(add-to-list 'load-path (concat custom-vendor-dir "js3-mode"))
(require 'js3-mode)

;; Mostly copied from starter-kit-js, settings to enable when using js3-mode.
(eval-after-load 'js3-mode
  '(progn (define-key js3-mode-map "{" 'paredit-open-curly)
          (define-key js3-mode-map "}" 'paredit-close-curly-and-newline)
          (add-hook 'js3-mode-hook 'esk-paredit-nonlisp)
          ;; required? - fixes problem with pretty function font-lock
          ;; (define-key js3-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js3-mode `(("\\(function *\\)("
                        (0 (progn (compose-region (match-beginning 1)
                                                  (match-end 1) "\u0192")
                                  nil)))))))

(provide 'init-javascript)
