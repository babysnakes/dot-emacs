;; clojure/clojurescript

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook '(lambda ()
                                (hs-minor-mode +1)))

(eval-after-load 'cider-mode
  '(progn
     (define-key clojure-mode-map (kbd "C-c , c") 'clojure-cheatsheet)
     (define-key clojure-mode-map (kbd "C-c , s") 'slamhound)))

(provide 'init-clojure)
