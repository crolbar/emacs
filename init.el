(load-theme 'tsdh-dark t)
(setq custom--inhibit-theme-enable nil)
(with-eval-after-load 'tsdh-dark-theme
  (custom-theme-set-faces
   'tsdh-dark
   '(mode-line ((t (:background "gray15" ))))
   '(minibuffer-prompt ((t (:foreground "peru" :weight bold))))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(set-face-attribute 'default nil :font "Hack" :height 150)

; custom fil
(setq custom-file "~/.emacs.d/emacs.custom.el")

; line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(pixel-scroll-precision-mode t)

; line wrap off
(setq-default truncate-lines t)

; normal scrolling
(setq scroll-step 1)
(setq scroll-margin 5)

; normal tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;  ___ ___ _  _ ___  ___ 
; | _ )_ _| \| |   \/ __|
; | _ \| || .` | |) \__ \
; |___/___|_|\_|___/|___/

; rebind M-t because it looks usefull
(global-set-key (kbd "M-y") 'transpose-words)




;       _           
;  _ __| |____ _ ___
; | '_ \ / / _` (_-<
; | .__/_\_\__, /__/
; |_|      |___/    

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; modes
(use-package nix-mode :ensure t :mode "\\.nix\\'")
(use-package web-mode :ensure t)
(use-package go-mode :ensure t)
(use-package lua-mode :ensure t)

(use-package rust-mode :ensure t)
; auto turn on lsp
;; (add-hook 'rust-mode-hook 'eglot-ensure)
(setq rust-mode-treesitter-derive t)

(use-package ron-mode :ensure t)

; lsp
(use-package eglot :ensure t)

; disable ref highligth & inlay hint
(setq eglot-ignored-server-capabilites '(:documentHighlightProvider :inlayHintProvider))

; make docs in echo area smaller
(setq eldoc-echo-area-prefer-doc-buffer t)
(setq eldoc-echo-area-use-multiline-p nil)


(use-package magit :ensure t)

(use-package diff-hl :ensure t)
(diff-hl-flydiff-mode)
(global-diff-hl-mode)

; set fringe color back to background
(set-face-background 'fringe "gray20")
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(use-package dired-gitignore :ensure t)
(dired-gitignore-global-mode t)
(global-set-key (kbd "C-x i") 'dired-gitignore-global-mode)


(use-package harpoon :ensure t)

(use-package undo-tree :ensure t)
(setq undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "undo-tree"))))
(setq undo-tree-visualizer-timestamps t)
(global-undo-tree-mode)


(use-package fzf :ensure t)
(global-set-key
 (kbd "C-x C-t")
 (lambda ()
   (interactive)
   (if (vc-root-dir)
       (fzf-git-files)
     (fzf))))


(use-package rg :ensure t)

(use-package smex :ensure t)
(use-package ido-completing-read+ :ensure t)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)


(global-set-key (kbd "M-x") 'smex)

;; swap these
(global-set-key (kbd "C-x C-d") 'ido-dired)
(global-set-key (kbd "C-x d") 'ido-list-directory)


;  _____   _____ _    
; | __\ \ / /_ _| |   
; | _| \ V / | || |__ 
; |___| \_/ |___|____|
;                     
(setq-default evil-want-keybinding nil)

(use-package evil :ensure t)
(use-package evil-collection :ensure t :after evil)
(use-package evil-surround :ensure t :after evil)

(evil-mode 8)
(evil-collection-init)
(global-evil-surround-mode 1)
(evil-set-undo-system 'undo-tree)

; C-u for half-screen up
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up))

; "unbind" 'K' and 'J' in visual
(with-eval-after-load 'evil
  (define-key evil-visual-state-map (kbd "K") 'evil-previous-line)
  (define-key evil-visual-state-map (kbd "J") 'evil-next-line))


; window movement
(global-set-key (kbd "M-H") 'evil-window-left)
(global-set-key (kbd "M-J") 'evil-window-down)
(global-set-key (kbd "M-K") 'evil-window-up)
(global-set-key (kbd "M-L") 'evil-window-right)


; lsp binds
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "SPC r n") 'eglot-rename)
  (define-key evil-normal-state-map (kbd "[ d") 'flymake-goto-prev-error)
  (define-key evil-normal-state-map (kbd "] d") 'flymake-goto-next-error)
  (define-key evil-insert-state-map (kbd "C-h") 'eldoc)
  (define-key evil-normal-state-map (kbd "SPC c a") 'eglot-code-actions))


; harpoon
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "SPC z") 'harpoon-toggle-file)
  (define-key evil-normal-state-map (kbd "SPC a") 'harpoon-add-file)

  (define-key evil-normal-state-map (kbd "M-a") 'harpoon-go-to-1)
  (define-key evil-normal-state-map (kbd "M-o") 'harpoon-go-to-2)
  (define-key evil-normal-state-map (kbd "M-e") 'harpoon-go-to-3)
  (define-key evil-normal-state-map (kbd "M-u") 'harpoon-go-to-4)
  (define-key evil-normal-state-map (kbd "M-i") 'harpoon-go-to-5)
  (define-key evil-normal-state-map (kbd "M-d") 'harpoon-go-to-6))
