;;; +theme.el -*- lexical-binding: t; -*-

(setq doom-theme 'modus-operandi)
;;(setq doom-theme 'modus-vivendi)
;;(setq doom-theme 'nimbus)
;;(setq doom-theme 'tao-yang)
;;(setq doom-theme 'tao-yin)
;;(setq doom-theme 'uwu)

;;transparency
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . light))

;;modeline
(use-package! doom-modeline)

(defun my-doom-modeline--font-height ()
  "Calculate the actual char height of the mode-line."
  (+ (frame-char-height) 2))

(after! doom-modeline
  (advice-add #'doom-modeline--font-height :override #'my-doom-modeline--font-height))

;; variable pitch
(add-hook 'prog-mode-hook
          (lambda ()
            (variable-pitch-mode -1)))

;;fonts
(defun open-fonts-folder-macos ()
  (interactive)
  (find-file "~/Library/fonts"))


;;modus theme color overrides
;;https://www.reddit.com/r/emacs/comments/qcwg80/modusthemessyntax_customization/
(setq modus-themes-syntax '(faint green-strings yellow-comments alt-syntax))

(setq modus-themes-vivendi-color-overrides
      '((bg-main . "#1d2021")
        (fg-main . "#c2c2c2")))

(custom-set-variables
 '(modus-themes-operandi-color-overrides '((fg-main . "#000000")
                                           (bg-main . "#faf8f5")
                                           (bg-region . "#efdfff")
                                           (bg-inactive . "#e6e4e1")
                                           (bg-hl-line . "#e6e4e1")))
 '(modus-themes-vivendi-color-overrides '((fg-main . "#fdf3ec")
                                          (bg-main . "#24242d")
                                          (bg-region . "#4f3d88")
                                          (bg-inactive . "#2f2f3b")
                                          (bg-hl-line . "#2f2f3b"))))

(defun customize-modus-vivendi nil
  (custom-set-variables
   '(modus-themes-syntax '(yellow-comments faint alt-syntax green-strings))))

(defun customize-modus-operandi nil
  (custom-set-variables
   '(modus-themes-syntax '(yellow-comments))))

(advice-add 'load-theme-dark :before 'customize-modus-vivendi)
(advice-add 'load-theme-light :before 'customize-modus-operandi)
