;;; init.el --- emacs configuration file
;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp/")

;;; Management Setup
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doc-view-ghostscript-options
   (quote
    ("-dNOSAFER" "-dNOPAUSE" "-sDEVICE=png16m" "-dTextAlphaBits=4" "-dBATCH" "-dGraphicsAlphaBits=4" "-dQUIET")))
 '(doc-view-ghostscript-program "\"/usr/local/bin/gs\"")
 '(js2-basic-offset 2)
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(python-check-command "pyflakes"))

(package-initialize)
;(elpy-enable)


;;; Use package Setup
(package-install 'use-package)
(package-install 'diminish)
(package-install 'bind-key)
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)


;;; assorted packages
(defvar my-packages '(better-defaults
                      projectile))


(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


;;; tern-mode
(use-package tern
  :config (add-hook 'js2-mode 'tern-mode)
  :ensure t)

;;; Clojure Mode
(use-package clojure-mode
  :ensure t)

;;; Cider
(use-package cider
  :ensure t)

;;; solidity-mode
(use-package solidity-mode
  :ensure t)

;;; Ido-ubiquitous
(use-package ido-ubiquitous
  :config (global-set-key (kbd "C-x C-f") 'ido-find-file)
  :ensure t)

;;; ido-vertical mode
(use-package ido-vertical-mode
  :ensure t)

;;; gnugo
(use-package gnugo
  :ensure t)

;;; helm
(use-package helm
  :config (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  :ensure t)
  
(use-package helm-projectile
  :config (helm-projectile-on)
  :ensure t)


;; ;;; Fly Check
;; (use-package flycheck
;;   :config (fadd-hook 'after-init-hook #'global-flycheck-mode)
;;   :ensure t)
(setq ispell-list-command "--list")


;;; gist
(use-package gist
  :ensure t)

;;; browse-kill-ring
(use-package browse-kill-ring
  :config (global-set-key (kbd "M-y") 'browse-kill-ring)
  :ensure t)

;;; Scala
(use-package scala-mode
  :config (add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
  :ensure t)

;;;Neotree
(use-package neotree
  :config (global-set-key [f7] 'neotree-find)
  (global-set-key [f8] 'neotree-toggle)
  :ensure t)

;;;js2-mode
(use-package js2-mode
  :config (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  :ensure t)

;;;exec-path-from-shell
(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns))
          (exec-path-from-shell-initialize))
  :ensure t)

;;;Smex
(use-package smex
  :ensure t)

;;; docker
(use-package docker
  :ensure t)

;;; angular-js
(use-package angular-mode
  :ensure t)

;;; angular-snippets
(use-package angular-snippets
  :ensure t)

;;; json-mode
(use-package json-mode
  :ensure t)

;;; json-reformat
(use-package json-reformat
  :ensure t)

;;; Rainbow Delimiters
(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  :ensure t)

(use-package zoom-window
  :config (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
  :ensure t)

;;; Markdown Mode
(use-package markdown-mode
  :ensure t)

;;; buffer-move
(use-package buffer-move
  :ensure t)

;;; org-downlaod 
(use-package org-download
  :ensure t)

;;; projectile
(use-package projectile
  :ensure t)

;;; flx-ido
(use-package flx-ido
  :ensure t)

;;; Elpy Mode
(use-package elpy
;; :config (add-hook 'python-mode-hook 'elpy-mode)
 :ensure t)

;;; Auto completion
(use-package auto-complete
  :config (require 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")      
  (ac-config-default)
  :ensure t)

;;; sbt-mode
(use-package sbt-mode
  :config (add-to-list 'auto-mode-alist '("\\.sbt\\'" . sbt-mode))
  :ensure t)

;;; Yasnippet
(use-package yasnippet
  :config (yas-global-mode t)
  :ensure t)

;;; Emacs IPython Notebook
(use-package ein
  :ensure t)

;;; Ensime
(use-package ensime
  :ensure t)

;;; Avy
(use-package avy
  :config (global-set-key (kbd "C-:") 'avy-goto-char-2)
  (global-set-key (kbd "C-'") 'avy-goto-char)
  (global-set-key (kbd "M-g f") 'avy-goto-line)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  (global-set-key (kbd "M-g e") 'avy-goto-word-0)
  :ensure t)

;;; Fill column indicator
(use-package fill-column-indicator
  :config
  (add-hook 'python-mode-hook (lambda ()
                                (setq fci-rule-column 79)
                                (fci-mode)))
  (add-hook 'matlab-mode-hook (lambda ()
                                (setq fci-rule-column 80)
                                (fci-mode)))
  :ensure t)


;;; iy-go-to-char
(use-package iy-go-to-char
  :ensure t)

;;; Auctex - Latex Mode
(use-package tex-site
  :ensure auctex)

;;; pdf-tools
(use-package pdf-tools
  :config (pdf-tools-install)
  :ensure t)

;;; magit
(use-package magit
  :ensure t)

;;; web-mode
(use-package web-mode
  :ensure t)


; path variable hack
(getenv "PATH")
 (setenv "PATH"
(concat
 "/usr/texbin" ":"

(getenv "PATH")))


;;; Ample Theme
(use-package ample-theme
  :config (set-face-attribute 'region nil :background "#8A0808")
  (global-hl-line-mode 1)
  :ensure t)


;;;; Miscellaneous

;;; Open init.el with F9
(global-set-key (kbd "<f9>")
		(lambda ()
		  (interactive)
		  (find-file-other-window user-init-file)))

;;; Toggle fullscreen with cmd-return
(global-set-key [s-return] 'toggle-frame-fullscreen)

;;; Better Scrolling
(setq scroll-margin 7
      scroll-step 1
      scroll-conservatively 10
      scroll-preserve-screen-position 1
      mouse-wheel-scroll-amount '(1 ((shift) . 1)))  ; one line at a time
      ;; mouse-wheel-progressive-speed nil)            ; don't accelerate


;;; Fix scrolling and bells
(global-set-key [wheel-right] 'ignore)	; This is because wheel-right
					; takes me off screen too easily
(global-set-key [wheel-left] 'scroll-right)


;;; Stop the bell ringing all the time
(defun my-bell-function ()
  "This bell function doesn't ring on certian occasions."
  (unless (memq this-command
	'(isearch-abort abort-recursive-edit exit-minibuffer
	      keyboard-quit mwheel-scroll down up next-line previous-line
	      backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)
(setq visible-bell nil)

;; Get rid of the splash screen
(setq inhibit-startup-message t)

;; org-mode hooks
(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'org-mode-hook 'visual-line-mode)


;; Get rid of the toolbar
(tool-bar-mode 0)

;; Copy line
(global-set-key "\C-c\C-l" "\C-a\C- \C-n\M-w")

;; Quiet erc
(setq erc-hide-list '("JOIN" "QUIT"))


;;; Default file openings
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))


;;; Helm open at bottome of screen
(add-to-list 'display-buffer-alist
                    `(,(rx bos "*helm" (* not-newline) "*" eos)
                         (display-buffer-in-side-window)
                         (inhibit-same-window . t)
                         (window-height . 0.4)))

;; Change the default font to Hack
(set-frame-font "DejaVu Sans Mono")

;; Turn line numbering on
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'matlab-mode-hook 'linum-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
