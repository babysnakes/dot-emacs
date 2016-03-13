;; packages stuff

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; list of required packages to install on startup if not installed.
(defvar my-packages '(;; general
                      expand-region
                      helm
                      ido-ubiquitous
                      smex
                      company
                      neotree

                      ;; clojure
                      clojure-mode
                      cider
                      clojure-cheatsheet
                      clj-refactor
                      slamhound

                      ;; ruby
                      inf-ruby
                      ruby-tools
                      projectile-rails

                      ;; erlang+elixir
                      erlang
                      alchemist
                      elixir-yasnippets

                      ;; elm
                      elm-mode

                      ;; Various modes
                      markdown-mode
                      yaml-mode

                      ;; style
                      color-theme-sanityinc-tomorrow
                      color-theme-sanityinc-solarized

                      ;; project management
                      magit
                      git-commit
                      projectile
                      helm-projectile

                      ;; editor
                      yasnippet
                      ace-jump-mode
                      paredit
                      smartparens
                      window-numbering))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-packages)
