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
(add-hook 'html-mode-hook 'yas-minor-mode)

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

;; HERLPERS ;;

;; http://whattheemacsd.com/buffer-defuns.el-02.html
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
