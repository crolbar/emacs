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


;  ___ ___ _  _ ___  ___ 
; | _ )_ _| \| |   \/ __|
; | _ \| || .` | |) \__ \
; |___/___|_|\_|___/|___/

; harpoon muscle memory
(global-set-key (kbd "M-a") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "M-o") (lambda () (interactive) (find-file "~/emacs-note.md")))
(global-set-key (kbd "M-e") (lambda () (interactive) (switch-to-buffer "TUTORIAL")))

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


(use-package magit :ensure t)

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
