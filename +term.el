;;; +term.el -*- lexical-binding: t; -*-

(use-package! counsel-term
  :defer 5
  :after term
  :config (setq counsel-th-history-file "~/.zsh_history"))

(defun p4v4n/term-toggle-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(define-key term-mode-map (kbd "s-j") 'p4v4n/term-toggle-mode)
(define-key term-raw-map (kbd "s-j") 'p4v4n/term-toggle-mode)
(define-key term-raw-map (kbd "C-y") 'term-paste)
(define-key term-raw-map (kbd "s-v") 'term-paste)
(define-key term-raw-map (kbd "C-G") 'term-interrupt-subjob)
(term-set-escape-char ?\C-x)
(define-key term-raw-map "\M-y" 'yank-pop)
(define-key term-raw-map "\M-w" 'kill-ring-save)
(defun term-send-Mbackspace () (interactive)(term-send-raw-string "\e\d"))
(define-key term-raw-map (kbd "M-<backspace>") 'term-send-Mbackspace)

;;https://emacs.stackexchange.com/questions/57946/send-a-single-raw-keystroke-to-ansi-term
(defun p4v4n/term-insert-literal (key)
    "Take a keypress and insert it literally into a terminal."
    (interactive "cPress key:")
    (term-send-raw-string (format "%c" key)))

(define-key term-raw-map (kbd "C-`") 'p4v4n/term-insert-literal)

;;-----------------------------------------------------------------------------------------

(defun ss-term-command (command)
  (sit-for 0.5)
  (term-send-raw-string command)
  (sit-for 0.5)
  (term-send-input)
  (sit-for 0.5))

(defun ss-term-secret (secret)
  (sit-for 1)
  (term-send-invisible secret)
  (sit-for 1)
  (term-send-input)
  (sit-for 1))

;; Root Access - setup get-my-remote-sudo-pass fn from secrets/auth
(defun auto-sudo (host)
  (ss-term-command "sudo su")
  (ss-term-secret (get-my-remote-sudo-pass)))

;; Screen
(defun detach-from-screen () (interactive) (execute-kbd-macro (kbd "C-a C-d")))
