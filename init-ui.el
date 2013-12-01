;; UI stuff

;; magit highlighting in terminal hides the changes :(
(eval-after-load 'magit
  (when (not window-system)
    (custom-set-faces '(magit-item-highlight ((t nil))))))

(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(provide 'init-ui)
