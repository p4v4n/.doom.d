;;; +posframe.el -*- lexical-binding: t; -*-

(use-package! ivy-posframe
  :after ivy
  :diminish ivy-posframe-mode
  ;; :custom-face
  ;; (ivy-posframe ((t (:background "#333244"))))
  ;; (ivy-posframe-border ((t (:background "#abff00"))))
  ;; (ivy-posframe-cursor ((t (:background "#00ff00"))))
  :hook (ivy-mode . ivy-posframe-mode)
  :config
  (setq ivyx-re-builders-alist '((t . ivy--regex-fuzzy)))
  (setq ivy-on-del-error-function #'ignore)
  ;; custom define height of post frame per function
  (setq ivy-posframe-height-alist '((swiper . 20)
                                    (find-file . 20)
                                    (counsel-ag . 15)
                                    (counsel-projectile-rg . 20)
                                    (t . 20)))
  (defun ivy-posframe-display-at-window-top-right (str)
    (ivy-posframe--display str #'posframe-poshandler-window-top-right-corner))
  (defun ivy-posframe-display-at-window-bottom-right (str)
    (ivy-posframe--display str #'posframe-poshandler-window-bottom-right-corner))
  ;; (setq ivy-posframe-min-width 10)
  ;; (setq ivy-posframe-width 30)
  ;; (setq ivy-posframe-min-height 10)
  (setq ivy-posframe-width 102
        ivy-posframe-height 16)

  (defun ivy-posframe-get-size ()
    "The default functon used by `ivy-posframe-size-function'."
    (list
     :height ivy-posframe-height
     :width ivy-posframe-width
     :min-height (or ivy-posframe-min-height (+ ivy-height 1))
     :min-width (or ivy-posframe-min-width (round (* (frame-width) 0.62)))))

  (setq ivy-posframe-parameters
        `((min-width . 70)
          (min-height . 10)
          (left-fringe . 0)
          (right-fringe . 0)
          (internal-border-width . 0)
          ))

  ;;(setq ivy-posframe-parameters nil)
  (setq ivy-posframe-display-functions-alist
        '((counsel-git-grep . ivy-posframe-display-at-frame-center)
          (counsel-grep . ivy-posframe-display-at-frame-center)
          (counsel-M-x . ivy-posframe-display-at-frame-center)
          (counsel-pt . ivy-posframe-display-at-frame-center)
          (counsel-ag . ivy-posframe-display-at-frame-center)
          (counsel-rg . ivy-posframe-display-at-frame-center)
          (swiper . ivy-posframe-display-at-frame-center)
          (ivy-completion-in-region . ivy-posframe-display-at-frame-center)
          (t . ivy-posframe-display-at-frame-center)))
  ;;(set-face-attribute 'ivy-posframe nil :foreground "white" :background "DarkSlateBlue")
  ;; (ivy-posframe-mode 1)
  )

(use-package! hydra-posframe
  :after hydra
  :hook (after-init . hydra-posframe-mode)
  :config (setq hydra-posframe-border-width 0)
  )


(use-package! which-key-posframe
  :after which-key
  ;;:hook (after-init . which-key-posframe-mode)
  :config
  (setq which-key-idle-delay 0.3)
  (setq which-key-posframe-width 70)
  (setq which-key-posframe-height 40)
  (setq which-key-side-window-max-height 0.50)
  (setq which-key-frame-max-height 50)
  (setq which-key-posframe-poshandler 'posframe-poshandler-frame-center)
  (which-key-posframe-mode 1))

(use-package! dired-posframe
  :after dired
  :config (setq dired-posframe-width 40
                dired-posframe-height 20))

(use-package! transient-posframe
  :after transient
  :hook (after-init . transient-posframe-mode)
  :config (transient-posframe-mode 1))
