;; various helper functions

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

(defun my-indent-buffer ()
  "Indent the entire buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun my-cleanup-buffer ()
  "Various cleanup operations."
  (interactive)
  (my-indent-buffer)
  (whitespace-cleanup))

(defun highlight-long-lines ()
  (setq whitespace-style '(face tabs empty trailing lines-tail)))

(defun hide-long-lines ()
  (setq whitespace-style '(face tabs empty trailing)))

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
  "Open iswitchb or, if in minibuffer go to next match. Handy way to cycle through the ring."
  (interactive)
  (if (window-minibuffer-p (selected-window))
      (keyboard-escape-quit)))

(provide 'init-functions)
