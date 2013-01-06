;; This file should be ignored by git.
(setq custom-file
      (concat user-emacs-directory "custom.el"))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(setq custom-vendor-dir (concat user-emacs-directory "vendor/"))

;; Various integrations
(add-hook 'nrepl-connected-hook 'esk-turn-on-paredit)

;; somehow these requires doesn't happen on startup. bug in libraries?
(require 'ruby-tools)
(require 'yaml-mode)

;; File associations
(add-to-list 'auto-mode-alist '("\\.md$"       . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$"     . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$"      . yaml-mode))

;; chef mode
(add-to-list 'load-path (concat custom-vendor-dir "chef-mode"))
(require 'chef-mode)
(setq chef-use-rvm nil)

;; some keyboard shortcut
(global-set-key (kbd "C-c =") 'er/expand-region)

;; ignored files in 'ffip'
(setq ffip-find-options "-not -regex \".*node_modules/.*\"")

;; enabled disabled commands
(put 'dired-find-alternate-file 'disabled nil)
