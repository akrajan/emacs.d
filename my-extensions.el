(defun buffer-mode (buffer)
  "Returns the major mode associated with a buffer."
  (interactive "b")
  (with-current-buffer buffer
     (message "Major mode: %s\nMinor mode: %s" major-mode minor-mode-list)))
