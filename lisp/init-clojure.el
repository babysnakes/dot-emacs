;; clojure/clojurescript

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook '(lambda ()
                                (eldoc-mode 1)
                                (hs-minor-mode +1)
                                (clj-refactor-mode 1)
                                (cljr-add-keybindings-with-prefix "C-c C-m")))

(eval-after-load 'cider-mode
  '(progn
     (define-key clojure-mode-map (kbd "C-c , c") 'clojure-cheatsheet)
     (define-key clojure-mode-map (kbd "C-c , s") 'slamhound)))

(provide 'init-clojure)
