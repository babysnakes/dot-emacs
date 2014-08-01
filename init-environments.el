;; Different environment for various projects

(defun set-environment (environment)
  (interactive "xEnvironment to set: ")
  (pcase environment
    (`rails (progn (load-theme 'sanityinc-solarized-light)
                   (setq whitespace-line-column 800)
                   (custom-title "Rails")
                   (global-set-key (kbd "C-x v C-g") 'vc-git-grep)))
    (`clientinfo (progn (load-theme 'sanityinc-tomorrow-blue)
                        (custom-title "Client Infos")))
    (`scripts (progn (load-theme 'sanityinc-tomorrow-day)
                     (custom-title "Scripts")))
    (`chef (progn (load-theme 'sanityinc-tomorrow-night)
                  (custom-title "Chef")))
    (_ (print "no such environment configured!"))))

(provide 'init-environments)
