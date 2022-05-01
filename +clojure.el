;;; +clojure.el -*- lexical-binding: t; -*-

(use-package! paredit
  :init
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode))

;; (use-package! lispy
;;   :init
;;   (add-hook 'clojure-mode-hook 'lispy-mode)
;;   (add-hook 'cider-repl-mode-hook 'lispy-mode)
;;   (add-hook 'emacs-lisp-mode-hook 'lispy-mode))

(use-package! cider
  :defer t
  :init
  (setq cider-repl-pop-to-buffer-on-connect t
        cider-save-file-on-load t
        cider-mode-line nil
        cider-prompt-for-symbol nil
        cider-prompt-save-file-on-load nil
        cider-show-error-buffer t
        cider-auto-select-error-buffer t
        cider-repl-history-file "~/.emacs.d/cider-history"
        cider-repl-wrap-history t
        cider-repl-history-size 10000
        cider-repl-use-clojure-font-lock t
        cider-docview-fill-column 70
        cider-stacktrace-fill-column 76
        nrepl-hide-special-buffers t
        nrepl-popup-stacktraces nil
        nrepl-log-messages nil
        cider-repl-use-pretty-printing t
        cider-repl-display-help-banner nil
        ;; https://github.com/clojure-emacs/cider/issues/2714
        cider-enhanced-cljs-completion-p nil
        ;; cider-shadow-default-options "app"
        cider-repl-result-prefix ";; => ")
  :config
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  ;;(add-hook 'cider-mode-hook #'company-mode)
  ;;(add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
  (define-key cider-repl-mode-map (kbd "s-k") 'cider-repl-clear-buffer))

(setq cljr-inject-dependencies-at-jack-in t)

(use-package! ivy-clojuredocs)

(use-package! flycheck-clj-kondo)

(use-package! clojure-essential-ref-nov)

(defun cider-kill-hanging-process ()
  (interactive)
  (delete-process "nrepl-server"))

;; babashka
(add-to-list 'exec-path "~/bin")
(add-to-list 'auto-mode-alist '("\\.bb\\'" . clojure-mode))
