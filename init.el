(load-theme 'tsdh-dark t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


(set-face-attribute 'default nil :font "Hack" :height 150)

; line wrap off
(setq-default truncate-lines t)



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



(use-package magit :ensure t)


(use-package evil :ensure t)

(evil-mode 8)

; C-r for redo
(evil-set-undo-system 'undo-redo)

; C-u for half-screen up
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up))
