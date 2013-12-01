;; Unset my custom LANG environment to avoid spell checker issues
(setenv "LANG")
(setenv "LC_TIME")

;; This file should be ignored by git.
(setq custom-file
      (concat (expand-file-name user-emacs-directory) "custom.el"))
(and (file-exists-p custom-file) (load custom-file))

(add-to-list 'load-path user-emacs-directory)
(setq custom-vendor-dir
      (concat (expand-file-name user-emacs-directory) "vendor/"))

(require 'init-packages)
(require 'init-functions)
(require 'init-ui)

;; GLOBAL SETTINGS
(projectile-global-mode)
(yas-global-mode t) ; always load yas
(require 'window-number) ; doesn't load automatically!!!
(window-number-mode)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c =") 'er/expand-region)
(global-set-key (kbd "C-c g") 'magit-status)

(add-to-list 'auto-mode-alist '("\\.yaml$"     . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$"      . yaml-mode))

(setq visible-bell t
      whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 80
      diff-switches "-u")

;; Disabled commands
(put 'dired-find-alternate-file 'disabled nil)

;; language specific settings
(require 'init-ruby)
(require 'init-coffeescript)
(require 'init-md)
