;;; init.el --- My custom configuration

;;; Commentary:

;;; Code:

;; Packages installation
(require 'prelude-packages)
(prelude-require-packages '(cider clj-refactor exec-path-from-shell multiple-cursors rubocop solarized-theme zoom-window))

;; Set correct $PATH
(require 'exec-path-from-shell)

(exec-path-from-shell-initialize)

;; Clojure configurations
(require 'clj-refactor)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (paredit-mode))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

;; multiple-cursors
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

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
