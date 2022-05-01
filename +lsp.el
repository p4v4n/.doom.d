;;; +lsp.el -*- lexical-binding: t; -*-

(use-package! lsp-mode
  :defer 5
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq ;;lsp-eldoc-enable-hover nil
   lsp-signature-auto-activate nil
   read-process-output-max (* 1024 1024)
   ;; lsp-enable-on-type-formatting nil
   ;;lsp-enable-symbol-highlighting nil
   )
  (setq lsp-auto-guess-root nil)
  (set-popup-rule! "^\\*lsp-help" :side 'right :size .50 :select t :vslot 1)
  :commands lsp)

(after! lsp-mode
  (setq lsp-restart 'ignore))

(use-package! lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (set-lookup-handlers! 'lsp-ui-mode
    :definition #'lsp-ui-peek-find-definitions
    :references #'lsp-ui-peek-find-references)
  (setq lsp-ui-doc-max-height 20
        lsp-ui-doc-max-width 150
        lsp-ui-sideline-ignore-duplicate t))

(use-package! dap-mode
  :defer t
  :after lsp-mode
  :config
  ;; (dap-mode t)
  ;; (dap-ui-mode t)
  )

(use-package! company-lsp
  :after lsp-mode
  :config
  (set-company-backend! 'lsp-mode 'company-capf)
  (setq company-lsp-enable-recompletion t))

;;go
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin"))
