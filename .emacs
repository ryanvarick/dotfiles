;; dump backup files in a single directory
(defun make-backup-file-name (file)
(concat "~/.emacs.d/" (file-name-nondirectory file) "~"))
