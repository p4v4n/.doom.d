;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

(package! zoom)

;;tramp
(package! tramp-term)
(package! counsel-tramp)
(package! docker-tramp)
(package! vagrant-tramp)
(package! ibuffer-tramp)

;;kubernetes
(package! k8s-mode)
(package! kubernetes)
(package! kubel)
(package! kubernetes-helm)
(package! kubernetes-tramp)

;;(package! aggresive-indent)

;;themes
(package! autothemer :recipe (:type git :host github :repo "jasonm23/autothemer"))
(package! theme-looper :recipe (:type git :host github :repo "myTerminal/theme-looper"))
(package! tao-theme)
(package! nimbus-theme)
(package! eclipse-theme)
(package! uwu-theme :recipe (:host github :repo "kborling/uwu-theme"))
(package! stimmung-themes :recipe (:type git :host github :repo "motform/stimmung-themes"))

(package! org-clock-convenience)

(package! nov :recipe (:type git :repo "https://depp.brause.cc/nov.el.git"))

(package! doom-modeline)

(package! deadgrep)

;;company
(package! company-lsp)
(package! company-box)
(package! company-flx)
(package! company-prescient)
(package! company-quickhelp)
(package! ivy-rich)
(package! flx)

;;posframe
(package! ivy-posframe)
(package! company-posframe)
(package! hydra-posframe :recipe (:type git :host github :repo "Ladicle/hydra-posframe"))
(package! which-key-posframe)
(package! transient-posframe)
(package! dired-posframe)

(package! elisp-demos)
(package! suggest)
(package! paredit)

(package! org-super-agenda)

(package! carbon-now-sh)
(package! shell-pop)
(package! terraform-doc)

(package! read-aloud)

(package! sx)

(package! alert)

(package! open-junk-file)

;;; disable
(package! iedit :disable t)

(package! keypression)
(package! spotlight)

(package! org-roam :recipe (:type git :host github :repo "org-roam/org-roam"))

(package! org-chef)

(package! org-gtd :recipe (:type git :host github :repo "Trevoke/org-gtd.el"))

(package! idle-org-agenda)

(package! debbugs)
(package! xterm-color)

(package! org-agenda-property)
(package! sane-term)

(package! ctable)

(package! tldr)

(package! snitch :recipe (:type git :host github :repo "mrmekon/snitch-el"))

(package! elegant-agenda-mode :recipe (:type git :host github :repo "justinbarclay/elegant-agenda-mode"))

(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))

(package! elfeed-org :recipe (:type git :host github :repo "remyhonig/elfeed-org"))

(package! counsel-term :recipe (:type git :host github :repo "tautologyclub/counsel-term"))

(package! esup :recipe (:type git :host github :repo "jschaf/esup"))

(package! feed-discovery :recipe (:type git :host github :repo "HKey/feed-discovery"))

(package! pomm :recipe (:host github :repo "SqrtMinusOne/pomm.el" :files (:defaults "resources")))

(package! hnreader :recipe (:type git :host github :repo "thanhvg/emacs-hnreader"))

(package! tshell :recipe (:type git :host github :repo "TatriX/tshell"))

(package! shelldon :recipe (:type git :host github :repo "Overdr0ne/shelldon"))

(package! mu4e-dashboard :recipe (:type git :host github :repo "rougier/mu4e-dashboard"))

(package! mu4e-alert :recipe (:type git :host github :repo "iqbalansari/mu4e-alert"))

(package! mu4e-views :recipe (:type git :host github :repo "lordpretzel/mu4e-views"))

(package! company-org-block :recipe (:type git :host github :repo "xenodium/company-org-block"))

(package! ob-sql-mode :recipe (:type git :host github :repo "nikclayton/ob-sql-mode"))

(package! websocket)

(package! org-roam-ui :recipe (:host github :repo "org-roam/org-roam-ui" :files ("*.el" "out")))

(package! unicode-fonts :recipe (:type git :host github :repo "rolandwalker/unicode-fonts"))

(package! tree-sitter :recipe (:type git :host github :repo "emacs-tree-sitter/elisp-tree-sitter"))

(package! tree-sitter-langs :recipe (:type git :host github :repo "emacs-tree-sitter/tree-sitter-langs"))

(package! declutter :recipe (:type git :host github :repo "sanel/declutter"))

(package! telega :recipe (:type git :host github :repo "zevlg/telega.el"))

(package! kubedoc :recipe (:type git :host github :repo "r0bobo/kubedoc.el"))

(package! gitconfig-mode :recipe (:host github :repo "magit/git-modes" :files ("gitconfig-mode.el")))

(package! gitignore-mode :recipe (:host github :repo "magit/git-modes" :files ("gitignore-mode.el")))

(package! benchmark-init)

(package! engine-mode)

(package! org-ql)

(package! reddigg)

(package! ivy-clojuredocs :recipe (:type git :host github :repo "wandersoncferreira/ivy-clojuredocs"))

(package! org-web-tools :recipe (:type git :host github :repo "alphapapa/org-web-tools"))

(package! map :pin "bb50dbaafc0f71743bd9ffd5784258a9fd682c20")

(package! org-fc :recipe (:type git :host github :repo "l3kn/org-fc"))

(package! shrface :recipe (:type git :host github :repo "chenyanming/shrface"))

(package! lispy :recipe (:type git :host github :repo "abo-abo/lispy" :branch "master"))

(package! dogears
  :recipe (:type git :host github :repo "alphapapa/dogears.el"
           :files (:defaults (:exclude "helm-dogears.el"))))

(package! org-modern :recipe (:type git :host github :repo "minad/org-modern"))

(package! pretty-hydra
  :recipe (:type git :host github :repo "jerrypnz/major-mode-hydra.el"
           :files (:defaults (:exclude "major-mode-hydra.el"))))

(package! why-this :recipe (:type git :repo "https://codeberg.org/akib/emacs-why-this.git"))

(package! impostman)
(package! verb)

(package! org-jira)

(package! clojure-essential-ref-nov)

(package! csv-mode)

(package! parseclj)

(package! sqlformat)
