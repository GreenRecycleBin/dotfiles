(setq version-control-enhancements-packages
      '(diff-mode
        diff-hl
        (git-gutter :excluded t)
        (git-gutter+ :excluded t)
        (git-gutter-fringe :excluded t)
        (git-gutter-fringe+ :excluded t)))

(defun version-control-enhancements/post-init-diff-hl ()
  (use-package diff-hl
    :defer t
    :init
    (progn
      (add-hook 'dired-mode-hook 'diff-hl-dired-mode))))
