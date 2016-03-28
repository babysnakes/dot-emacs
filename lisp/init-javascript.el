;; javascript

;; add key-binding to web-beautify-js (json-mode-prettify adds
;; backslashes before slashes).
(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-, f j") 'web-beautify-js))

(custom-set-variables
 '(js-indent-level 2)
 '(js2-basic-offset 2))

(provide 'init-javascript)
