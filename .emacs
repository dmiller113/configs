;;Function to kill other buffers
(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;;Package setup
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  ;;(add-to-list `load-path "/Users/danielmiller//Users/danielmiller/.emacs.d/elpa/use-package-20171204.1703")
  (require 'use-package))

;; grabbing packages
(use-package markdown-mode
  :ensure t)
(use-package evil
  :ensure t
  :config
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode)))
(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader ",")
  (global-evil-leader-mode)
  (evil-leader/set-key
    "b" 'switch-to-buffer
    "B" 'helm-buffers-list
    "k" 'kill-buffer
    "K" 'kill-this-buffer
    "e" 'eval-last-sexp
    "E" 'eval-buffer
    "f" 'helm-find-files
    "o" 'kill-other-buffers
    "O" 'delete-other-windows
    "r" 'split-window-right
    "X" 'helm-M-x
    "w" 'save-buffer)
  )
(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (helm-mode 1))
(use-package rjsx-mode
  :ensure t)
(use-package dracula-theme
  :ensure t)
(use-package linum-relative
  :ensure t
  :config
  (require 'linum-relative)
  (global-linum-mode)
  (linum-relative-mode)
  (setq linum-relative-current-symbol ""))
(use-package sass-mode
  :ensure t)

;; Start the emacs server
(server-start)

;; Parens mode
(show-paren-mode t)

;; Set up packages
(require 'evil)
(evil-mode t)

(require 'helm)

(require 'markdown-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "/User/danielmiller/.emacs/backups"))))
 '(js2-strict-trailing-comma-warning nil)
 '(package-selected-packages
   (quote
    (sass-mode linum-relative evil-surround rjsx-mode dracula-theme helm evil-mode markdown-mode use-package evil-visual-mark-mode evil-leader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; handling whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook (lambda () (untabify (point-min) (point-max))))
(setq delete-trailing-lines nil)
(setq tab-width 2)
(setq indent-tabs-mode nil)
(setq js-indent-level 2)
(defvaralias 'c-basic-offset 'tab-width)
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 100)
(global-whitespace-mode t)

;;Lock files
(setq create-lockfiles nil)

;;mode-line customizations
(set-face-foreground 'mode-line "green")
(set-face-background 'mode-line "black")

;;SMERGE dealing with shit default keys
(setq smerge-command-prefix "\C-cv")

;;Font is font
(set-frame-font "Hack-16" nil t)
