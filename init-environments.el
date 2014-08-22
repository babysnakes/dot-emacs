;; Different environment for various projects

(defun set-environment-rails ()
  (interactive)
  (progn (load-theme 'sanityinc-solarized-light)
         (setq whitespace-line-column 800)
         (custom-title "Rails")
         (global-set-key (kbd "C-x v C-g") 'vc-git-grep)))

(defun set-environment-clientinfo ()
  (interactive)
  (progn (load-theme 'sanityinc-tomorrow-blue)
         (custom-title "Client Infos")))

(defun set-environment-scripts ()
  (interactive)
  (progn (load-theme 'sanityinc-tomorrow-day)
         (custom-title "Scripts")))

(defun set-environment-chef ()
  (interactive)
  (progn (load-theme 'sanityinc-tomorrow-night)
         (custom-title "Chef")))

(defun set-environment-classifiers ()
  (interactive)
  (progn (load-theme 'sanityinc-tomorrow-bright)
         (custom-title "Classifiers")))

(provide 'init-environments)
