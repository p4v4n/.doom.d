;;; +keybindings.el -*- lexical-binding: t; -*-

(global-set-key (kbd "s-D") 'duplicate-line)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
(global-set-key (kbd "M-;") 'comment-or-uncomment-line-or-region)

(global-set-key (kbd "s-t") 'projectile-find-file)
(global-set-key (kbd "s-g") 'projectile-grep)
(global-set-key (kbd "s-p") 'projectile-switch-project)

;;(global-set-key (kbd "C-c n") 'indent-region-or-buffer)

(global-set-key (kbd "s-f") 'swiper)
(global-set-key "\C-s" 'swiper)

;;(global-set-key (kbd "C-x 4") 'toggle-window-split)
;;(global-set-key (kbd "C-x k") 'volatile-kill-buffer)

;; undo
(global-set-key (kbd "C-z") 'undo)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-S-z") 'redo)

;; git
(global-set-key (kbd "C-x m") 'magit-status)
