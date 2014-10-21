;; Web development settings

;; multi-web-mode
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags
      '((js-mode "<script[^>]*>" "</script>")
        (css-mode "<style[^>]*>" "</style>")
        (ruby-mode "<%[^ ]?" "[^ ]?%>")))
(setq mweb-filename-extensions '("htm" "html" "erb"))
(multi-web-global-mode 1)

(provide 'init-web)
