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

(defvar my-savefile-dir (expand-file-name "savefile" user-emacs-directory)
  "This folder stores all the automatically generated save/history-files.")

(unless (file-exists-p my-savefile-dir)
  (make-directory my-savefile-dir))

(require 'init-packages)
(require 'init-functions)
(require 'init-ui)

;; GLOBAL SETTINGS
(defalias 'yes-or-no-p 'y-or-n-p)
(projectile-global-mode)
(yas-global-mode t) ; always load yas
(require 'window-number) ; doesn't load automatically!!!
(window-number-mode)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c =") 'er/expand-region)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c n") 'my-cleanup-buffer)
(global-set-key (kbd "C-x m") 'eshell)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)
(global-set-key (kbd "C-x C-i") 'imenu)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c q") 'join-line)
;; (global-set-key (kbd "M-%") 'query-replace-regexp)
;; (global-set-key (kbd "C-M-%") 'query-replace)
;; (global-set-key (kbd "C-M-h") 'backward-kill-word)

(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(setq visible-bell t
      diff-switches "-u")

;; ido/smex
(require 'ido)
(require 'ido-ubiquitous)
(require 'flx-ido)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" my-savefile-dir)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)
(ido-ubiquitous-mode +1)
;; smarter fuzzy matching for ido
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

;; smex, remember recently and most frequently used commands
(require 'smex)
(setq smex-save-file (expand-file-name ".smex-items" my-savefile-dir))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Disabled commands
(put 'dired-find-alternate-file 'disabled nil)

;; Whitespace mode
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail))
(global-whitespace-mode 1)

;; Paredit
(eval-after-load 'paredit
  ;; key bindings that works on terminal
  '(progn
     (define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-(") 'paredit-backward-slurp-sexp)))

;; language specific settings
(require 'init-clojure)
(require 'init-ruby)
(require 'init-coffeescript)
(require 'init-md)
(require 'init-lisp)
