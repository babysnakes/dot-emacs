;;; My new init.el based on use-package :)

;;; Helper Functions
(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

;; see http://whattheemacsd.com/buffer-defuns.el-02.html
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* ((w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2)))
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(defun my-indent-buffer ()
  "Indent the entire buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun my-cleanup-buffer ()
  "Various cleanup operations."
  (interactive)
  (my-indent-buffer)
  (whitespace-cleanup))

(defun my-local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun dos2unix ()
  "Not exactly but it's easier to remember"
  (interactive)
  (set-buffer-file-coding-system 'unix 't))

;; Toggle between split windows and a single window
;; original: https://gist.github.com/quux00/3383607
(defun toggle-windows-split ()
  "Switch back and forth between one window and whatever split of
  windows we might have in the frame. The idea is to maximize the
  current buffer, while being able to go back to the previous split
  of windows in the frame simply by calling this command again."
  (interactive)
  (if (not (window-minibuffer-p (selected-window)))
      (progn
        (if (< 1 (count-windows))
            (progn
              (window-configuration-to-register ?u)
              (delete-other-windows))
          (jump-to-register ?u))))
  (my-iswitchb-close))

(defun my-iswitchb-close ()
  "Open iswitchb or, if in minibuffer go to next match. Handy way
  to cycle through the ring."
  (interactive)
  (if (window-minibuffer-p (selected-window))
      (keyboard-escape-quit)))

;; more useful default frame title. Include project if available.
(defun project-title ()
  "Name the frame according to the projectile project (or main)"
  (setq frame-title-format
        `("Emacs ("
          (:eval (if (projectile-project-p)
                     (file-name-base (substring (projectile-project-p) 0 -1))
                   "main"))
          ") - "
          (:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b")))))
(project-title)

;; set custom title
(defun custom-title (s)
  "Add a string to the title (inside parenthesis after invocation name)"
  (interactive "sEnter short description: ")
  (setq frame-title-format
        `("Emacs (" ,s ") - "
          (:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b")))))

(defun set-custom-title ()
  "Add a custom title according to the daemon name"
  (interactive)
  (when (boundp 'server-name)
    (if (equal server-name "server")
        (custom-title "main")
      (custom-title server-name))))

;;; Global Settings

(setenv "DICTIONARY" "en_US")

;; This file should be ignored by git.
(setq custom-file
      (concat (expand-file-name user-emacs-directory) "custom.el"))
(and (file-exists-p custom-file) (load custom-file))

;; Set larger fonts and larger default size on mac
(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(font . "Menlo-14"))
  (add-to-list 'default-frame-alist '(height . 49))
  (add-to-list 'default-frame-alist '(width . 124)))

;; some ui related key gindings
(define-key global-map (kbd "C-|") 'toggle-windows-split)

(show-paren-mode t)
(setq-default indent-tabs-mode nil)
(custom-set-variables
 '(visible-bell t)
 '(x-select-enable-clipboard t)
 '(x-select-enable-primary t)
 '(mouse-yank-at-point t)
 '(inhibit-startup-screen t)
 '(ring-bell-function 'ignore) ; Avoid annoying square in gui
 '(scroll-margin 0)            ; nice scrolling
 '(scroll-conservatively 100000)
 '(scroll-preserve-screen-position 1))

;; by default disable menu-bar, scroll-bar and tool-bar.
(menu-bar-mode -1)
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; meaningful names for buffers with the same name
(require 'uniquify)
(custom-set-variables
 '(uniquify-separator "/")
 '(uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
 '(uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers
 '(uniquify-buffer-name-style 'forward))

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; text resize
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; save 2 chars when answering yes or no :)
(defalias 'yes-or-no-p 'y-or-n-p)

(comment
 ;; TODO: is it required?
 (add-hook 'text-mode-hook 'turn-on-auto-fill)
 (add-hook 'prog-mode-hook 'my-local-comment-auto-fill))

;; remember last edit place in file.
(require 'saveplace)
(setq-default save-place t)
(custom-set-variables
 '(save-place-file (concat user-emacs-directory "places")))

;; TODO: ispell/hunspell check for better configuration (e.g. rw-hunspell)
;; also consider using flyspell-prog-mode!
(custom-set-variables
 '(ispell-program-name "hunspell")
 '(ispell-local-dictionary "en_US"))

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(setq save-interprogram-paste-before-kill t
      diff-switches "-u"
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

(global-set-key (kbd "C-c n") 'my-cleanup-buffer)
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-i") 'imenu)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c q") 'join-line)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-, d p") 'delete-pair)
(global-set-key (kbd "C-, c") 'compile)

;; Disabled commands
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; whitespace
(require 'whitespace)
(custom-set-variables
 '(whitespace-line-column 80)
 '(whitespace-style '(face tabs empty trailing lines-tail)))
(global-whitespace-mode 1)
(global-set-key (kbd "C-, w t") 'whitespace-toggle-options)


;;; Setup use-package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-pin "melpa-stable")

;;; Global and Project management packages
(use-package expand-region
  :commands er/expand-region
  :init
  (bind-key "C-=" 'er/expand-region))

(use-package helm
  :ensure t
  :bind
  (("C-c h" . helm-mini)
   ("M-x" . helm-M-x))
  :init
  (helm-mode 1))

(use-package neotree
  :bind ("C-, t" . neotree-toggle))

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status))

(use-package git-commit
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode 1))

(use-package helm-projectile
  :ensure t
  :bind ("C-, p b" . helm-projectile-switch-to-buffer))

(use-package window-numbering
  :commands window-numbering-mode)

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  :commands multiple-cursors-mode)

(use-package ace-jump-mode
  :bind ("C-, SPC" . ace-jump-mode))

(use-package ag
  :commands
  (ag ag-files ag-regexp ag-project ag-project-files ag-project-regexp))

(use-package yasnippet
  :commands yas-global-mode
  :init
  (when (package-installed-p 'yasnippet)
    (yas-global-mode)))

(use-package paredit
  :commands enable-paredit-mode
  :bind (:map paredit-mode-map
              ("M-)" . paredit-forward-slurp-sexp)
              ("M-(" . paredit-backward-slurp-sexp))
  :init
  (when (package-installed-p 'paredit)
    (dolist (mode '(scheme emacs-lisp lisp))
      (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
                'enable-paredit-mode))))

(use-package smartparens
  :commands smartparens-mode
  :config
  (require 'smartparens-config))

(use-package company
  :commands company-mode
  :bind
  ("C-S-SPC" . company-complete))

(use-package flycheck
  :commands flycheck-mode)

;;; Clojure
(use-package clojure-mode
  :defer t
  :config
  (add-hook 'clojure-mode-hook
            '(lambda ()
               (enable-paredit-mode)
               (eldoc-mode 1)
               (hs-minor-mode +1)
               (clj-refactor-mode 1)
               (cljr-add-keybindings-with-prefix "C-c C-m"))))

(use-package cider
  :commands (cider-jack-in cider-connect)
  :bind (:map clojure-mode-map
              ("C-c , c" . clojure-cheatsheet))
  :config
  (add-hook 'cider-repl-mode-hook 'enable-paredit-mode))

(use-package clojure-cheatsheet
  :commands clojure-cheatsheet)

(use-package clj-refactor
  :commands (clj-refactor-mode cljr-add-keybindings-with-prefixq))

(defun full-clojure-env ()
  "Add more clojure specific setting to the working environment"
  (interactive)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode))

;;; Elixir/Erlang
(use-package erlang
  :mode ("\\.erl\\'" . erlang-mode))

(use-package elixir-mode
  :defer t)

(use-package alchemist
  ;; Do I want to use the bindings below?
  ;; (define-key erlang-mode-map (kbd "M-,") 'alchemist-goto-jump-back)
  :commands alchemist-mode)

(use-package elixir-yasnippets
  :defer t)

;;; Ruby
(setq ruby-deep-indent-paren nil)
(setq rspec-use-rake-when-possible nil)
(add-hook 'ruby-mode-hook '(lambda ()
                             (ruby-tools-mode +1)
                             (subword-mode +1)
                             (smartparens-mode +1)))

(use-package inf-ruby
  :commands inf-ruby inf-ruby-mode
  :config
  (add-to-list 'inf-ruby-implementations '("bconsole" . "bundle console")))

(use-package ruby-tools
  :commands ruby-tools-mode)

(use-package projectile-rails
  :commands projectile-rails-mode
  :config
  (add-hook 'projectile-mode-hook 'projectile-rails-on))

;;; Javascript
(custom-set-variables '(js-indent-level 2))

(use-package json-mode
  :defer t)

(use-package js2-mode
  :commands (js2-mode js2-minor-mode)
  ;; Need to decide wether we want to use it as the main javascript
  ;; library or as minor mode. It's also possible to add an
  ;; interpreter to it (node).
  :config
  (custom-set-variables '(js2-basic-offset 2)))

(use-package tern
  :commands tern-mode)

(use-package web-beautify
  :bind (:map json-mode-map
              ("C-, f j" . web-beautify-js)))

;;; Scala
(use-package scala-mode
  :defer t)

(use-package sbt-mode
  :defer t)

(use-package ensime
  :defer t)

;;; Web Pages
(use-package multi-web-mode
  :commands multi-web-mode
  :config
  (custom-set-variables
   '(mweb-default-major-mode 'html-mode)
   '(mweb-tags '((js-mode "<script[^>]*>" "</script>")
                 (css-mode "<style[^>]*>" "</style>")
                 (ruby-mode "<%[^ ]?" "[^ ]?%>")))
   '(mweb-filename-extensions '("htm" "html" "erb"))))

;;; GoLang
(use-package go-mode
  :bind
  (:map go-mode-map
        ("M-." . godef-jump))
  :config
  (add-hook 'go-mode-hook
            (lambda ()
              (custom-set-variables '(indent-tabs-mode t)
                                    '(tab-width 2)
                                    '(gofmt-command "goimports"))
              (add-hook 'before-save-hook 'gofmt-before-save)))
  (use-package godoctor))

(defun full-go-environment ()
  "Load a full go environment including company-mode completions"
  (interactive)
  (let ((godoc-dir (concat (file-name-as-directory (getenv "GOPATH"))
                           "src/github.com/nsf/gocode/emacs-company")))
    (when (file-exists-p godoc-dir)
      (add-to-list 'load-path godoc-dir)
      (require 'company-go)
      (add-hook 'go-mode-hook
                (lambda ()
                  (set (make-local-variable 'company-backends) '(company-go))
                  (company-mode)
                  (flycheck-mode))))))

;;; Haskell
(use-package haskell-mode
  :defer t)

;;; Lilypond
(use-package lilypond-mode
  :mode ("\\.ly$" . LilyPond-mode)
  ;; This load-path works on mac. Linux is hopefully site-packages.
  :load-path
  "/Applications/LilyPond.app/Contents/Resources/share/emacs/site-lisp"
  :config
  (custom-set-variables '(LilyPond-pdf-command "open")))

;;; Other formats
(use-package markdown-mode
  ;; I used to set css-paths but I don't use preview anymore
  :defer t)

(use-package yaml-mode
  :defer t)

(use-package dockerfile-mode
  :defer t)

(use-package systemd
  :commands systemd-mode)

(use-package nginx-mode
  :commands nginx-mode)

;;; Miscelenious packages
(use-package edit-server
  :commands edit-server-start)
