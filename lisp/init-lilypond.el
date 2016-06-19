;; Copied from lilypond distribution

(add-to-list 'load-path (concat custom-vendor-dir "lilypond"))
(load-file (concat custom-vendor-dir "lilypond/lilypond-init.el"))
(add-to-list 'Info-directory-list (concat custom-vendor-dir "lilypond"))

(provide 'init-lilypond)
