;; UI stuff

;; Avoid annoying square in gui
(setq ring-bell-function 'ignore)

;; Set larger fonts and larger default size
(add-to-list 'default-frame-alist '(font . "Menlo-14"))
(add-to-list 'default-frame-alist '(height . 49))
(add-to-list 'default-frame-alist '(width . 124))

;; some ui related key gindings
(define-key global-map (kbd "C-|") 'toggle-windows-split)

;; magit highlighting in terminal hides the changes :(
;; (eval-after-load 'magit
;;   (when (not window-system)
;;     (custom-set-faces '(magit-item-highlight ((t nil))))))

(setq inhibit-startup-screen t)
(show-paren-mode t)
(setq-default indent-tabs-mode nil)
(setq visible-bell t
      x-select-enable-clipboard t
      x-select-enable-primary t
      mouse-yank-at-point t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; by default disable menu-bar, scroll-bar and tool-bar.
(menu-bar-mode -1)
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))

;; set custom title
(defun custom-title (s)
  "Add a string to the title (inside parenthesis after invocation name)"
  (interactive "sEnter short description: ")
  (setq frame-title-format
        `("" invocation-name " (" ,s ") - "
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

;; text resize
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; default theme on gui mode
(when (window-system) (load-theme 'sanityinc-tomorrow-night))

(provide 'init-ui)
