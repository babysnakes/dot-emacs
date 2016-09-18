;; Copied from lilypond distribution

(let ((lilypond-path "/Applications/LilyPond.app/Contents/Resources/share/emacs/site-lisp"))
  (when (file-accessible-directory-p lilypond-path)
    (setq load-path (append (list lilypond-path) load-path))
    (load-file (concat lilypond-path "/lilypond-init.el"))
    (setq LilyPond-pdf-command "open")))

(provide 'init-lilypond)
