;; packages stuff

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; list of required packages to install on startup if not installed.
(defvar my-packages '(better-defaults
		                  clojure-mode
                      clojure-test-mode
                      inf-ruby
                      ruby-tools
                      rinari
                      coffee-mode
                      less-css-mode
                      markdown-mode
                      yaml-mode
                      color-theme-sanityinc-tomorrow
		      color-theme-sanityinc-solarized
                      expand-region
		      magit
                      git-commit-mode
                      projectile
                      yasnippet
		      ace-jump-mode
                      zencoding-mode
		      paredit
                      window-number))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-packages)
