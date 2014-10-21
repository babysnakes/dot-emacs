;; Markdown

(add-to-list 'auto-mode-alist '("\\.md$"       . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; Styling
(setq markdown-css-path
      (concat custom-vendor-dir "files/Clearness.css"))

(provide 'init-md)
