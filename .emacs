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
  :ensure t)
(use-package evil-leader
  :ensure t)
(use-package helm
  :ensure t)
(use-package rjsx-mode
  :ensure t)
(use-package dracula-theme
  :ensure t)

;; Start the emacs server
(server-start)


;; Set up packages
(require 'evil-leader)
(evil-leader/set-leader ",")
(global-evil-leader-mode)
(evil-leader/set-key
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "x" 'eval-last-sexp
  "X" 'eval-buffer
  "f" 'helm-find-files
  "O" 'delete-other-windows
  "X" 'helm-M-x
  "w" 'save-buffer)

(require 'evil)
(evil-mode t)

(require 'helm)
(require 'helm-config)
(helm-mode 1)

(require 'markdown-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rjsx-mode dracula-theme helm evil-mode markdown-mode use-package evil-visual-mark-mode evil-leader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
