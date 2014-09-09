(defun buffer-mode (buffer)
  "Returns the major mode associated with a buffer."
  (interactive "b")
  (with-current-buffer buffer
     (message "Major mode: %s\nMinor mode: %s" major-mode minor-mode-list)))

(require 'misc)
(defun ruby-forward-word-hook()
  (modify-syntax-entry ?_ "w" c++-mode-syntax-table))

(add-hook 'ruby-mode-hook 'ruby-forward-word-hook)


(defun choose-directory (directory)
  "sample that uses interactive to get a directory"
  (interactive (list (read-directory-name "What directory? ")))
  (message "You chose %s " (file-truename directory)))


(require 'dash)

(defun opt-buffer-filename (b)
  (if (buffer-file-name b)
      (file-truename (buffer-file-name b))))



(defun get-dir-buffers (dirname)
  (let* ((buffer-files (mapcar (lambda (b)
                                 (list b (opt-buffer-filename b)))
                               (buffer-list)))
         (with-files (-filter 'cadr buffer-files)))
    (-map 'car with-files)))

(defun kill-dir-buffers (directory)
  "sample that uses interactive to get a directory"
  (interactive (list (read-directory-name "What directory? ")))
  (let ((buffers (get-dir-buffers directory)))
    (mapc 'kill-buffer buffers)))
