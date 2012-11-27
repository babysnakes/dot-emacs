;; This file should be ignored by git.
(setq custom-file
      (concat user-emacs-directory "custom.el"))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(setq custom-vendor-dir (concat user-emacs-directory "vendor/"))

;; chef mode
(add-to-list 'load-path (concat custom-vendor-dir "chef-mode"))
(require 'chef-mode)
(setq chef-use-rvm nil)

;; enabled disabled commands
(put 'dired-find-alternate-file 'disabled nil)
