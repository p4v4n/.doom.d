;;; +org.el -*- lexical-binding: t; -*-

(after! 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (eshell . t)
     (clojure . t)
     (go . t)
     (python . t)
     (bash . t)
     (sh . t)
     (sql . t)
     (screen . t)
     (scheme . t)
     (ruby . t)
     (dot . t))
   ))

(after! org
  (setq org-src-window-setup 'current-window
        org-return-follows-link t
        org-confirm-babel-evaluate nil
        org-startup-with-inline-images t
        org-startup-folded t
        org-use-speed-commands t
        org-catch-invisible-edits 'show)
  (setq org-ellipsis " ▼ ")

  ;; Define the custum capture templates
  (setq org-default-capture-file "~/org/org-gtd/inbox.org")
  (setq org-capture-templates
        '(("t" "todo" entry (file+headline org-default-capture-file "Refile")
           "* TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
          ("m" "Meeting" entry (file+headline org-default-capture-file "Meetings")
           "* MEETING with %? :MEETING:\n%t" :clock-in t :clock-resume t)
          ("y" "Idea" entry (file+headline org-default-capture-file "Ideas")
           "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
          ))

  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))


  (setq org-agenda-property-list '("LOCATION" "CATEGORY" "Effort")))

(after! org-superstar
  (with-eval-after-load 'org-superstar
    (set-face-attribute 'org-superstar-item nil :height 1.2)
    (set-face-attribute 'org-superstar-header-bullet nil :height 1.2)
    (set-face-attribute 'org-superstar-leading nil :height 1.3))
  (setq org-superstar-headline-bullets-list
        '("◉" "◈" "○" "▷"))
  (setq org-superstar-cycle-headline-bullets nil)
  ;; Hide away leading stars on terminal.
  (setq org-superstar-leading-fallback ?\s))

(use-package! idle-org-agenda
  :defer 3
  :after (org-agenda org-gtd)
  :config
  (setq idle-org-agenda-interval 1800)
  (idle-org-agenda-mode))

(use-package! elegant-agenda-mode
  :after org
  :defer 4
  :hook org-agenda-mode-hook)

(use-package! org-pandoc-import :after org)

(use-package! company-org-block
  :after (org company)
  :defer 4
  :custom
  (company-org-block-edit-style 'prompt) ;; 'auto, 'prompt, or 'inline
  :hook ((org-mode . (lambda ()
                       (setq-local company-backends '(company-org-block))
                       (company-mode +1)))))

(setq org-image-actual-width 800)
;;(setq org-image-actual-width nil)

(use-package! org-ql
  :after org
  :defer 5)

(use-package! org-web-tools
  :after org
  :config (setq org-web-tools-pandoc-sleep-time 2))

(after! org
  (setq org-emphasis-alist
        '(("*" (bold :slant italic :weight black )) ;; this make bold both italic and bold, but not color change
          ("/" (italic :foreground "dark salmon" )) ;; italic text, the text will be "dark salmon"
          ("_" underline :foreground "cyan" ) ;; underlined text, color is "cyan"
          ("=" (:background "snow1" :foreground "deep slate blue" )) ;; background of text is "snow1" and text is "deep slate blue"
          ("~" (:background "PaleGreen1" :foreground "dim gray" ))
          ("+" (:strike-through nil :foreground "dark orange" ))))

  (defun org-emphanise-underline ()
    (interactive)
    (org-emphasize ?_)))

;; (define-key global-map "\C-q" 'org-emphanise-underline)

(use-package! org-modern
  :after org)

(after! org-modern
  (add-hook 'org-mode-hook #'org-modern-mode)
  (setq
   org-auto-align-tags nil
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis nil
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "⭠ now ─────────────────────────────────────────────────")
  )
