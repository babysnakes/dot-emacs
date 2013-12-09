;; JavaScript settings

(eval-after-load 'js
  '(progn
     (setq js-indent-level 2)
     (add-hook 'js-mode-hook 'subword-mode)))


(provide 'init-javascript)
