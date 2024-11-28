(load-theme 'tsdh-dark t)
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
(use-package rust-mode :ensure t)


(use-package magit :ensure t)

(use-package diff-hl :ensure t)
(global-diff-hl-mode)


(use-package harpoon :ensure t)

(use-package undo-tree :ensure t)
(setq undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "undo-tree"))))
(setq undo-tree-visualizer-timestamps t)
(global-undo-tree-mode)

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
(evil-set-leader nil (kbd "SPC"))

; revert buffer bind

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "M-r") 'revert-buffer))

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

; C-r for redo
(evil-set-undo-system 'undo-redo)

; harpoon
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "SPC") 'evil-send-leader)
  (define-key evil-normal-state-map (kbd "<leader> z") 'harpoon-toggle-file)
  (define-key evil-normal-state-map (kbd "<leader> a") 'harpoon-add-file)
  (define-key evil-normal-state-map (kbd "<leader> r") 'harpoon-delete-item)

  (define-key evil-normal-state-map (kbd "M-a") 'harpoon-go-to-1)
  (define-key evil-normal-state-map (kbd "M-o") 'harpoon-go-to-2)
  (define-key evil-normal-state-map (kbd "M-e") 'harpoon-go-to-3)
  (define-key evil-normal-state-map (kbd "M-u") 'harpoon-go-to-4)
  (define-key evil-normal-state-map (kbd "M-i") 'harpoon-go-to-5)
  (define-key evil-normal-state-map (kbd "M-d") 'harpoon-go-to-6))
