;;; +git.el -*- lexical-binding: t; -*-

(use-package! magit
  :defer 3
  :bind ("C-x m" . magit-status)
  :config (setq magit-commit-arguments nil
                magit-diff-refine-hunk t
                magit-set-upstream-on-push t
                magit-stage-all-confirm nil
                magit-unstage-all-confirm nil
                magit-restore-window-configuration t
                magit-save-repository-buffers 'dontask))

(use-package! forge
  :defer t
  :after magit
  :config  (setq forge-topic-list-limit '(80 . 0)))


(use-package! why-this
  :config
  (global-why-this-mode)
  (setq why-this-idle-delay 1.2))
