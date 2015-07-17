;;; init.el --- My custom configuration

;;; Commentary:

;;; Code:

;; Packages installation
(require 'prelude-packages)
(prelude-require-packages '(cider solarized-theme zoom-window))

;; zoom-window
(require 'zoom-window)

(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
(setq zoom-window-mode-line-color "DarkGreen")

(defun prelude-copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(load-theme 'solarized-dark t)

;;; init.el ends here
