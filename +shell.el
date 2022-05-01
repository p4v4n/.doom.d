;;; +shell.el -*- lexical-binding: t; -*-

(use-package! shell-pop
  :defer 2
  :config
  (custom-set-variables
   '(shell-pop-shell-type '("term" "*term*" (lambda nil (term shell-pop-term-shell))))
   '(shell-pop-term-shell "/bin/zsh")
   '(shell-pop-window-size 32)
   '(shell-pop-full-span t)
   '(shell-pop-window-position "bottom")
   '(shell-pop-autocd-to-working-dir t)
   '(shell-pop-restore-window-configuration t)
   '(shell-pop-cleanup-buffer-at-process-exit t)))

(after! shell-pop
  (global-set-key (kbd "M-t") 'shell-pop))

;;-------------------------------------

(use-package! tshell
  :defer t
  :after transient)

(use-package! shelldon
  :defer t
  :config (setq shelldon-ansi-colors 1))

(defun update-doom-emacs ()
  (interactive)
  (require 'shelldon)
  (let ((default-directory "~/.emacs.d"))
    (shelldon-async-command "bin/doom sync")))
