;;; init.el --- emacs configuration file
;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp/")

;;; Management Setup
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "c006bc787154c31d5c75e93a54657b4421e0b1a62516644bd25d954239bc9933" "de8fa309eed1effea412533ca5d68ed33770bdf570dcaa458ec21eab219821fd" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "e8a9dfa28c7c3ae126152210e3ccc3707eedae55bdc4b6d3e1bb3a85dfb4e670" default)))
 '(doc-view-ghostscript-options
   (quote
    ("-dNOSAFER" "-dNOPAUSE" "-sDEVICE=png16m" "-dTextAlphaBits=4" "-dBATCH" "-dGraphicsAlphaBits=4" "-dQUIET")))
 '(doc-view-ghostscript-program "\"/usr/local/bin/gs\"")
 '(fci-rule-color "#2e2e2e")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(js2-basic-offset 2)
 '(magit-diff-use-overlays nil)
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(python-check-command "pyflakes")
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   (quote
    ((20 . "#dd5542")
     (40 . "#CC5542")
     (60 . "#fb8512")
     (80 . "#baba36")
     (100 . "#bdbc61")
     (120 . "#7d7c61")
     (140 . "#6abd50")
     (160 . "#6aaf50")
     (180 . "#6aa350")
     (200 . "#6a9550")
     (220 . "#6a8550")
     (240 . "#6a7550")
     (260 . "#9b55c3")
     (280 . "#6CA0A3")
     (300 . "#528fd1")
     (320 . "#5180b3")
     (340 . "#6380b3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(web-mode-markup-indent-offset 2)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

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

;; small-neotree-find
(defun small-neotree-find ()
  "Creates a neotree frame with smaller font."
  (interactive)
  (neotree-find)
  (text-scale-adjust 0)
  (text-scale-decrease 2))

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

;; ;;; Ido-ubiquitous
;; (use-package ido-ubiquitous
;; ;  :config (global-set-key (kbd "C-x C-f") 'ido-find-file)
;;   :ensure t)

;;; ido-vertical mode
(use-package ido-vertical-mode
  :ensure t)

;;; gnugo
(use-package gnugo
  :ensure t)

;;; helm
(use-package helm
  :config (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x C-b") #'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)  
  :ensure t)

;;; helm-projectile
(use-package helm-projectile
  :config (helm-projectile-on)
  :ensure t)

;;; gradle-mode
(use-package gradle-mode
  :config (add-to-list 'auto-mode-alist '("\\.gradle\\'" . gradle-mode))
  :ensure t)

;; ;;; groovy-mode
;; (use-package groovy-mode
;;   :config (add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
;;   :ensure t)

;; ;;; Fly Check
;; (use-package flycheck
;;   :config (fadd-hook 'after-init-hook #'global-flycheck-mode)
;;   :ensure t)
(setq ispell-list-command "--list")


;; ;;; gist
;; (use-package gist
;;   :ensure t)

;;; browse-kill-ring
(use-package browse-kill-ring
  :config (global-set-key (kbd "M-y") 'browse-kill-ring)
  :ensure t)

;;; smartparens
(use-package smartparens
  :ensure t)

;;; Scala
(use-package scala-mode2
  :config (add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
  :ensure t)

;;;Neotree
(use-package neotree
  :config (global-set-key [f7] 'small-neotree-find)
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

;; ;;;Smex
;; (use-package smex
;;   :ensure t)

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

;;; jsx-mode
(use-package jsx-mode
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

;;; window-layout
(use-package window-layout
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

;; ;;; flx-ido
;; (use-package flx-ido
;;   :ensure t)

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


;;; evil
(use-package evil
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
  :config (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  :ensure t)

;;; smooth-scrolling
(use-package smooth-scrolling
  :ensure t)

;;; god-mode
(use-package god-mode
  :config (global-unset-key (kbd "C-'"))
  (global-set-key (kbd "C-'") 'god-local-mode)
  (global-set-key (kbd "M-'") (lambda () (interactive) (insert "'")))
  :ensure t)


; path variable hack
(getenv "PATH")
(setenv "PATH" (concat  "/usr/texbin" ":" (getenv "PATH")))

;; ;;; Ample Theme
;; (use-package ample-theme
;;   :config (set-face-attribute 'region nil :background "#8A0808")
;;   (global-hl-line-mode 1)
;;   :ensure t)

;; ;;; ample-zen-theme
;; (use-package ample-zen-theme
;;   :ensure t)

;;; monokai-theme
(use-package darkokai-theme
  :ensure t)

;;;; Miscellaneous

;;; Open init.el with F9
(global-set-key (kbd "<f9>")
		(lambda ()
		  (interactive)
		  (find-file-other-window user-init-file)))

;;; Toggle fullscreen with cmd-return
(global-set-key [s-return] 'toggle-frame-fullscreen)

;; ;;; Better Scrolling
;; (setq scroll-margin 7
;;       scroll-step 1
;;       scroll-conservatively 10
;;       scroll-preserve-screen-position 1
;;       mouse-wheel-scroll-amount '(1 ((shift) . 1)))  ; one line at a time
;;       ;; mouse-wheel-progressive-speed nil)            ; don't accelerate


;; ;;; Fix scrolling and bells
;; (global-set-key [wheel-right] 'ignore)	; This is because wheel-right
;; 					; takes me off screen too easily
;; (global-set-key [wheel-left] 'scroll-right)


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

;; delete files
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))
(global-set-key (kbd "C-c D")  'delete-file-and-buffer)




;; layout definition
(global-set-key (kbd "M-n")
                (lambda ()
                  (interactive)
                  (delete-other-windows)
                  (small-neotree-find)
                  (next-multiframe-window)
                  (split-window-below)
                  (enlarge-window 17)
                  (next-multiframe-window)
                  (split-window-right)
                  (ansi-term "/usr/local/bin/bash")
                  (next-multiframe-window)
                  (find-file "~/.emacs.d/init_settings.el")
                  (next-multiframe-window)
                  (next-multiframe-window)
                  ))


;; Change the default font to Hack
(set-frame-font "DejaVu Sans Mono-12")

;; Turn line numbering on
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'matlab-mode-hook 'linum-mode)
(setq linum-delay t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
