;; packages stuff

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; list of required packages to install on startup if not installed.
(defvar my-packages '(;; general
                      expand-region
                      helm
                      ido-ubiquitous
                      flx-ido
                      smex

                      ;; clojure
                      clojure-mode
                      clojure-test-mode
                      cider
                      clojure-cheatsheet
                      slamhound

                      ;; ruby
                      inf-ruby
                      ruby-tools
                      rinari
                      yari
                      robe

                      ;; js/css/web
                      js-comint
                      nodejs-repl
                      coffee-mode
                      less-css-mode
                      markdown-mode
                      yaml-mode
                      zencoding-mode

                      ;; style
                      color-theme-sanityinc-tomorrow
                      color-theme-sanityinc-solarized

                      ;; project management
                      magit
                      git-commit-mode
                      projectile

                      ;; editor
                      yasnippet
                      ace-jump-mode
                      paredit
                      window-number))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-packages)
