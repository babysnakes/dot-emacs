(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; list of required packages to install on startup if not installed.
(defvar my-packages '(starter-kit
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-lisp
                      starter-kit-ruby
                      ace-jump-mode
                      ack-and-a-half
                      clojure-mode
                      clojure-test-mode
                      coffee-mode
                      color-theme-sanityinc-tomorrow
                      expand-region
                      git-commit-mode
                      inf-ruby
                      less-css-mode
                      markdown-mode
                      nrepl-ritz
                      projectile
                      rinari
                      ruby-tools
                      yaml-mode
                      yasnippet
                      zencoding-mode
                      window-number))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-packages)
