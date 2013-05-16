;; Unset my custom LANG environment to avoid spell checker issues
(setenv "LANG")
(setenv "LC_TIME")

;; This file should be ignored by git.
(setq custom-file
      (concat (expand-file-name user-emacs-directory) "custom.el"))
(load custom-file)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(setq custom-vendor-dir
      (concat (expand-file-name user-emacs-directory) "vendor/"))

;; enable projectile
(projectile-global-mode)

;; Various integrations
(add-hook 'nrepl-connected-hook 'esk-turn-on-paredit)
(add-hook 'html-mode-hook 'yas-minor-mode)
(add-hook 'js-mode-hook 'yas-minor-mode)

;; somehow these requires doesn't happen on startup. bug in libraries?
(require 'ruby-tools)
(require 'yaml-mode)

;; File associations
(add-to-list 'auto-mode-alist '("\\.md$"       . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$"     . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$"      . yaml-mode))

;; Markdown styling
(setq markdown-css-path
      (concat custom-vendor-dir "files/Clearness.css"))

;; chef mode
(add-to-list 'load-path (concat custom-vendor-dir "chef-mode"))
(require 'chef-mode)
(setq chef-use-rvm nil)

;; some keyboard shortcut
(global-set-key (kbd "C-c =") 'er/expand-region)

;; ignored files in 'ffip'
(setq ffip-find-options "-not -regex \".*node_modules/.*\"")

;; Ruby settings
(setq ruby-deep-indent-paren nil)

;; CoffeeScript
(setq coffee-tab-width 2)

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

;; A helper to construct ffip find options (ignored directoreis).
;; usage:
;; (setq ffip-find-options
;;       (ffip--create-exclude-find-options
;;        '("node_modules"
;;          "target"
;;          "vendor")))
(defun ffip--create-exclude-find-options (names)
  (mapconcat (lambda (name)
               (concat "-not -regex \".*" name ".*\"")) names " "))

;; Mostly copied from starter-kit-js, settings to enable when using js2-mode.
(eval-after-load 'js2-mode
  '(progn (setq-default js2-basic-offset 2)
          (define-key js2-mode-map "{" 'paredit-open-curly)
          (define-key js2-mode-map "}" 'paredit-close-curly-and-newline)
          (add-hook 'js2-mode-hook 'esk-paredit-nonlisp)
          (add-hook 'js2-mode-hook 'yas-minor-mode)
          ;; required? - fixes problem with pretty function font-lock
          ;; (define-key js2-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js2-mode `(("\\(function *\\)("
                        (0 (progn (compose-region (match-beginning 1)
                                                  (match-end 1) "\u0192")
                                  nil)))))))
