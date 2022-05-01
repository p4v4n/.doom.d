;;; +zettelkasten.el -*- lexical-binding: t; -*-

(setq deft-directory "~/org/.org/org-roam")
(setq org-roam-directory "~/org/.org/org-roam")

(use-package! org-fc
  :after org
  :config (setq org-fc-directories '("~/org/flashcards/")))

(use-package! org-roam
  :after (org deft)
  :bind (:map org-roam-mode-map
         (("C-c n l" . org-roam)
          ("C-c n f" . org-roam-node-file)
          ("C-c n g" . org-roam-graph))
         :map org-mode-map
         (("C-c n i" . org-roam-node-insert))
         (("C-c n I" . org-roam-node-insert-immediate)))
  :config (setq org-roam-directory "~/org/.org/org-roam")
  (setq +org-roam-open-buffer-on-find-file t)
  (setq org-roam-v2-ack t)
  ;;(setq +org-roam-open-buffer-on-find-file t)
  ;;(org-roam-db-autosync-mode)
  ;;(setq org-roam-database-connector 'libsqlite3)
  )

(global-set-key (kbd "C-M-s") 'org-roam-node-find)

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))

(setq org-roam-v2-ack t)

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme nil
        org-roam-ui-follow nil
        org-roam-ui-update-on-save nil
        org-roam-ui-open-on-start nil))
