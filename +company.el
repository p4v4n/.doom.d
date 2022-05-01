;;; +company.el -*- lexical-binding: t; -*-

(use-package! company
  :defer 3
  :bind (("C-c C-/" . company-complete))
  :config (global-company-mode)
  (setq company-idle-delay 0.5)
  (setq company-minimum-prefix-length 1)
  ;; (setq company-show-numbers t)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (setq company-tooltip-limit 8)
  (setq company-tooltip-minimum-width 32)
  (setq company-tooltip-minimum 5)
  ;;(setq company-transformers '(company-sort-by-occurrence))
  (setq company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil)
  (setq company-backends
        '(company-capf company-dabbrev company-files company-yasnippet))
  (setq company-global-modes '(not comint-mode erc-mode message-mode help-mode gud-mode eshell-mode))
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-t") 'company-search-toggle-filtering))

(after! prescient
  (setq-default history-length 1000)
  (setq-default prescient-history-length 1000))

(after! counsel
  (setq counsel-evil-registers-height 20
        counsel-yank-pop-height 20
        counsel-org-goto-face-style 'org
        counsel-org-headline-display-style 'title
        counsel-org-headline-display-tags t
        counsel-org-headline-display-todo t))

(use-package! company-quickhelp
  :after company
  :defer 3
  :hook (company-mode . company-quickhelp-mode)
  )

(after! company
(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))

(use-package! company-box
  :defer 3
  :after company
  :config
  (setq company-tooltip-minimum-width 32)
  ;; (setq company-box-max-candidates 5)
  :hook
  (company-mode . company-box-mode))

(use-package! company-prescient
  :defer 3
  :after company
  :hook (company-mode . company-prescient-mode))

(after! (js2-mode comapany)
  (set-company-backend! 'js2-mode 'company-tide 'company-yasnippet))

(after! (sh-script company)
  (set-company-backend! 'sh-mode
    '(company-shell :with company-yasnippet)))

(after! (eshell-mode company)
  (set-company-backend! 'sh-mode nil))

(use-package! company-org-block
  :after company
  :custom
  (company-org-block-edit-style 'auto) ;; 'auto, 'prompt, or 'inline
  :hook ((org-mode . (lambda ()
                       (setq-local company-backends '(company-org-block))
                       (company-mode +1)))))

(add-hook 'org-mode-hook
          (lambda ()
            (add-to-list (make-local-variable 'company-backends)
                         'company-org-block)))

(after! (org company-org-block)
  (add-to-list 'company-backends 'company-org-block)
  (set-company-backend! 'org-mode '(company-org-block company-capf)))
