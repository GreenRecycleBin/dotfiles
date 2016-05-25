(defconst version-control-enhancements-packages
      '(diff-hl
        (git-gutter :excluded t)
        (git-gutter+ :excluded t)
        (git-gutter-fringe :excluded t)
        (git-gutter-fringe+ :excluded t)))

(defun version-control-enhancements/post-init-diff-hl ()
  (spacemacs|use-package-add-hook diff-hl
    :post-config (add-hook 'dired-mode-hook 'diff-hl-dired-mode)))
