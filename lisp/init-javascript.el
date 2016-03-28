;; javascript

;;; JS beautifier functions
;;; Copied from: https://github.com/wash/js-beautifier/blob/master/emacs.txt

(defun js-beautify-region ()
  "Run js-beautify on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "js-beautify -f -" nil t)
    (javascript-mode)))

(defun js-beautify-buffer ()
  "Run js-beautify on buffer"
  (interactive)
  (let ((p (point)))
    (save-excursion
      (shell-command-on-region (point-min) (point-max) "js-beautify -n -f -" nil t))
    (goto-char p)
    (javascript-mode)))

(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-, f j") 'js-beautify-buffer))

(provide 'init-javascript)
