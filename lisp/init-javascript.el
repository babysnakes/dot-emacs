;; javascript

;; add key-binding to web-beautify-js (json-mode-prettify adds
;; backslashes before slashes).
(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-, f j") 'web-beautify-js))

(provide 'init-javascript)
