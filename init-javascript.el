;; JavaScript settings

;; js-comint
(defun set-js-comint-shortcuts ()
  (local-set-key "\C-x\C-e"
                 'js-send-last-sexp)
  (local-set-key "\C-\M-x"
                 'js-send-last-sexp-and-go)
  (local-set-key "\C-cb"
                 'js-send-buffer)
  (local-set-key "\C-c\C-b"
                 'js-send-buffer-and-go)
  (local-set-key (kbd "C-, r")
                 'js-send-region)
  (local-set-key (kbd "C-, C-r")
                 'js-send-region-and-go))

(setq inferior-js-program-command "node")
(ansi-color-for-comint-mode-on)
(add-to-list
 'comint-preoutput-filter-functions
 (lambda (output)
   (replace-regexp-in-string "\033\\[[0-9]+[A-Z]" "" output)))

;; JS Mode
(eval-after-load 'js
  '(progn
     (setq js-indent-level 2)
     (add-hook 'js-mode-hook 'subword-mode)
     (add-hook 'js-mode-hook 'set-js-comint-shortcuts)))

(provide 'init-javascript)
