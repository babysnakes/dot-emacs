;; Web development settings

;; multi-web-mode
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags
      '((js-mode "<script[^>]*>" "</script>")
        (css-mode "<style[^>]*>" "</style>")
        (ruby-mode "<%[^ ]?" "[^ ]?%>")))
(setq mweb-filename-extensions '("htm" "html" "erb"))

(provide 'init-web)
