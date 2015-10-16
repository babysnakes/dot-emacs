;; Ruby settings

(setq ruby-deep-indent-paren nil)
(setq rspec-use-rake-when-possible nil)

;; ruby files
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))

;; We never want to edit Rubinius bytecode or MacRuby binaries
(add-to-list 'completion-ignored-extensions ".rbc")
(add-to-list 'completion-ignored-extensions ".rbo")

;; not loaded automatically by the package!!!
(require 'ruby-tools)
;;(require 'chruby)

(add-hook 'ruby-mode-hook '(lambda ()
                             (ruby-tools-mode +1)
                             (subword-mode +1)
                             (smartparens-mode +1)))
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; add `bundle exec pry` invocaiton to inf-ruby
(eval-after-load 'inf-ruby
  `(add-to-list 'inf-ruby-implementations '("bconsole" . "bundle console")))

(provide 'init-ruby)
