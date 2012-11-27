;; This file should be ignored by git.
(setq custom-file
      (concat user-emacs-directory "custom.el"))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; enabled disabled commands
(put 'dired-find-alternate-file 'disabled nil)
