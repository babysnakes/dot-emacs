;; packages stuff

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; list of required packages to install on startup if not installed.
(defvar my-packages '(;; general
                      better-defaults
                      expand-region
                      helm

                      ;; clojure
                      clojure-mode
                      clojure-test-mode

                      ;; ruby
                      inf-ruby
                      ruby-tools
                      rinari

                      ;; js/css/web
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
