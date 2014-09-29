(defun buffer-mode (buffer)
  "Returns the major mode associated with a buffer."
  (interactive "b")
  (with-current-buffer buffer
     (message "Major mode: %s\nMinor mode: %s" major-mode minor-mode-list)))

(require 'misc)
(defun ruby-forward-word-hook()
  (modify-syntax-entry ?_ "w" c++-mode-syntax-table))

(add-hook 'ruby-mode-hook 'ruby-forward-word-hook)

(require 'dash)

(defun opt-buffer-filename (b)
  (if (buffer-file-name b)
      (file-truename (buffer-file-name b))))

(defun get-buffer-files (&optional buffers)
  (let ((buffers (or buffers (buffer-list))))
    (mapcar (lambda (b)
              (list b (opt-buffer-filename b)))
            buffers)))

(defun get-file-from-buffer-file (bf)
  (cadr bf))

(defun get-buffer-from-buffer-file (bf)
  (car bf))

(defun file-backed-buffers (&optional buffers)
  (-filter 'get-file-from-buffer-file (get-buffer-files buffers)))

(defun get-dir-buffers (dirname)
  (let* ((dirfile (file-truename dirname)))
    (-filter (lambda (bf)
            (string-prefix-p dirfile (get-file-from-buffer-file bf)))
          (file-backed-buffers))))

(defun except-dir-buffers (dirname)
  (let* ((dirfile (file-truename dirname)))
    (-filter (lambda (bf)
            (not (string-prefix-p dirfile (get-file-from-buffer-file bf))))
          (file-backed-buffers))))

(defun a/kill-dir-buffers (directory)
  "sample that uses interactive to get a directory"
  (interactive (list (read-directory-name "What directory? ")))
  (let ((buffers (mapcar 'car (get-dir-buffers directory))))
    (mapc 'kill-buffer buffers)))

(defun a/kill-except-dir-buffers (directory)
  "sample that uses interactive to get a directory"
  (interactive (list (read-directory-name "What directory? ")))
  (let ((buffers (mapcar 'car (except-dir-buffers directory))))
    (mapc 'kill-buffer buffers)))
