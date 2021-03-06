;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Harri Taylor"
      user-mail-address "harritaylor@pm.me")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Go Mono" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Go" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

; (use-package! nano-emacs
;   :init
;   (require 'nano-base-colors)
;   (require 'nano-colors)
;   (require 'nano-faces)
;   (require 'nano-theme)
;   (require 'nano-theme-dark)
;   (require 'nano-theme-light)
;   (require 'nano-splash)
;   (require 'nano-modeline)
;   (nano-faces)
;   (nano-theme))
(setq which-key-idle-delay 0.5)
(add-hook 'python-mode-local-vars-hook #'lsp!)

;; $DOOMDIR/config.el
(use-package! org-pandoc-import :after org)

;; (use-package! lsp-pyright
;;   ;; :ensure t
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp))))  ; or lsp-deferred


(setq deft-extensions '("md" "txt" "org"))
(setq deft-default-extension "md")
(setq deft-directory (expand-file-name "~/Dropbox/deft"))

;; (use-package! ranger-key
;;   :init (ranger-override-dired-mode t))

;; (setq org-roam-directory "~/Dropbox/Notes/roam")
;; (add-hook 'after-init-hook #'org-roam-mode)


(setq org-journal-file-format "%Y-%m-%d.org")
(setq org-journal-file-type 'weekly)
(setq org-journal-start-on-weekday '7)
(setq org-journal-enable-agenda-integration 't)
(setq org-journal-date-format "%A, %d %B %Y")
