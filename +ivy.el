;;; +ivy.el -*- lexical-binding: t; -*-

(after! ivy
  (setq ivy-use-selectable-prompt t
        ivy-auto-select-single-candidate t
        ivy-rich-parse-remote-buffer nil
        ivy-use-virtual-buffers nil
        ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-cd-selected
        ivy-height 20)

  (global-set-key (kbd "C-x b") '+ivy/switch-buffer)

  (ivy-add-actions
   'counsel-M-x
   `(("h" +ivy/helpful-function "Helpful"))))

(use-package! all-the-icons-ivy
  :after ivy
  :config
  (dolist (cmd '(counsel-find-file
                 counsel-file-jump
                 projectile-find-file
                 counsel-projectile-find-file
                 counsel-dired-jump counsel-projectile-find-dir
                 counsel-projectile-switch-project))
    (ivy-set-display-transformer cmd #'all-the-icons-ivy-file-transformer)))

(use-package! ivy-rich
  :after ivy
  :custom
  (ivy-virtual-abbreviate 'full)
  (ivy-rich-switch-buffer-align-virtual-buffer nil)
  (ivy-rich-path-style 'full)
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-rich-mode))

(setq prescient-sort-full-matches-first t)
