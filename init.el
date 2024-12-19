;; theme
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

;; font
(setq default-frame-alist '((font . "Hack")))
(set-face-attribute 'default nil :font "Hack" :height 150)

(set-face-attribute 'font-lock-builtin-face nil :foreground "light coral")
(set-face-attribute 'font-lock-regexp-grouping-backslash nil :foreground "dark turquoise")
(set-face-attribute 'font-lock-number-face nil :foreground "dodger blue")

;; custom file
(setq custom-file "~/.emacs.d/emacs.custom.el")

;; line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(pixel-scroll-precision-mode t)

;; line wrap off
(setq-default truncate-lines t)

;; normal scrolling
(setq scroll-step 1)
(setq scroll-margin 5)
(setq hscroll-step 1)
(setq auto-window-vscroll nil)
(setq scroll-conservatively 101)

;; normal tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


(setq echo-keystrokes 0.3)

;;  _    _         _    
;; | |__(_)_ _  __| |___
;; | '_ \ | ' \/ _` (_-<
;; |_.__/_|_||_\__,_/__/

;; rebind M-t because it looks usefull
(global-set-key (kbd "M-y") 'transpose-words)

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x b") 'list-buffers)

(global-set-key (kbd "C-k") 'previous-error)
(global-set-key (kbd "C-j") 'next-error)

(global-set-key (kbd "C-s") nil)

;;;         _           
;;;    _ __| |____ _ ___
;;;   | '_ \ / / _` (_-<
;;;   | .__/_\_\__, /__/
;;;   |_|      |___/    

(load "~/.emacs.d/pkg.el")
(load "~/.emacs.d/tmp.el")

;;                _        
;;  _ __  ___  __| |___ ___
;; | '  \/ _ \/ _` / -_|_-<
;; |_|_|_\___/\__,_\___/__/
(pkg-install-multi
 '(
   nix-mode
   web-mode
   go-mode
   lua-mode
   php-mode
   rust-mode
   groovy-mode

   ;; non programming
   ron-mode
   markdown-mode
   )
 )


;;              _   
;;  _ _ _  _ __| |_ 
;; | '_| || (_-<  _|
;; |_|  \_,_/__/\__|

;; auto turn on lsp
;;(add-hook 'rust-mode-hook 'eglot-ensure)
(setq rust-mode-treesitter-derive t)



;;   __ 
;;  / _|
;;  \__|

(setq-default c-basic-offset 4)
(add-hook 'c-mode-hook
          (lambda () (interactive)
            (c-toggle-comment-style -1)))


;;  _         
;; | |____ __ 
;; | (_-< '_ \
;; |_/__/ .__/
;;      |_|   

(pkg-install-once 'eglot)

;; disable ref highligth & inlay hint
(setq eglot-ignored-server-capabilites '(:documentHighlightProvider :inlayHintProvider))

;; make docs in echo area smaller
(setq eldoc-echo-area-prefer-doc-buffer t)
(setq eldoc-echo-area-use-multiline-p nil)


;;   __ _ __  _ __ 
;;  / _| '  \| '_ \
;;  \__|_|_|_| .__/
;;           |_|   

(pkg-install-once 'corfu)

(global-corfu-mode)
(setq corfu-auto nil)
(setq corfu-popupinfo-mode t)
(setq corfu-popupinfo-delay 0.2)

(pkg-install-once 'yasnippet)
;; idk how to disable this crap so..
(setq yas-keymap nil)
(custom-set-faces '(yas-field-highlight-face ((t ()))))

;;    __      _   
;;   / _|_ __| |_ 
;;  |  _| '  \  _|
;;  |_| |_|_|_\__|

(setq-default clang-format-style "{BasedOnStyle: Mozilla, IndentWidth: 4}")

(add-hook 'c-mode-hook
          (lambda () (interactive)
            (local-set-key (kbd "M-f") 'clang-format-buffer)))

(add-hook 'java-mode-hook
          (lambda () (interactive)
            (local-set-key (kbd "M-f") 'clang-format-buffer)))

;;        _ _   
;;   __ _(_) |_ 
;;  / _` | |  _|
;;  \__, |_|\__|
;;  |___/       

(pkg-install-multi '(magit diff-hl dired-gitignore))

(diff-hl-flydiff-mode)
(global-diff-hl-mode)

;; set fringe color back to background
(set-face-background 'fringe "gray20")
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(dired-gitignore-global-mode t)
(global-set-key (kbd "C-x i") 'dired-gitignore-global-mode)


;;               _     
;;  _  _ _ _  __| |___ 
;; | || | ' \/ _` / _ \
;;  \_,_|_||_\__,_\___/
(pkg-install-once 'undo-tree)
(setq undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "undo-tree"))))
(setq undo-tree-visualizer-timestamps t)
(global-undo-tree-mode)


;;   __ _         _ 
;;  / _(_)_ _  __| |
;; |  _| | ' \/ _` |
;; |_| |_|_||_\__,_|

(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)

(pkg-install-multi
 '(
   fzf
   rg
   smex
   ido-completing-read+  
   )
 )

(ido-ubiquitous-mode 1)

(global-set-key
 (kbd "C-x C-t")
 (lambda ()
   (interactive)
   (if (vc-root-dir)
       (fzf-git-files)
     (fzf))))

(global-set-key (kbd "M-x") 'smex)

;; swap these
(global-set-key (kbd "C-x C-d") 'ido-dired)
(global-set-key (kbd "C-x d") 'ido-list-directory)



;;        _        
;;  _ __ (_)___ __ 
;; | '  \| (_-</ _|
;; |_|_|_|_/__/\__|

(pkg-install-multi
 '(
   harpoon
   popwin
   )
 )
(popwin-mode 1)

;;  _____   _____ _    
;; | __\ \ / /_ _| |   
;; | _| \ V / | || |__ 
;; |___| \_/ |___|____|
(setq-default evil-want-keybinding nil)

(pkg-install-multi
 '(
   evil
   evil-collection
   evil-surround
   )
 )

(evil-mode 1)
(evil-collection-init)
(global-evil-surround-mode 1)
(evil-set-undo-system 'undo-tree)

;; evil binds
(with-eval-after-load 'evil
  ;; C-u for half-screen up
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

  ;; "unbind" 'K' and 'J' in visual
  (define-key evil-visual-state-map (kbd "K") 'evil-previous-line)
  (define-key evil-visual-state-map (kbd "J") 'evil-next-line)

  ;; window movement
  (global-set-key (kbd "M-H") 'evil-window-left)
  (global-set-key (kbd "M-J") 'evil-window-down)
  (global-set-key (kbd "M-K") 'evil-window-up)
  (global-set-key (kbd "M-L") 'evil-window-right)

  ;; lsp binds
  (define-key evil-normal-state-map (kbd "SPC r n") 'eglot-rename)
  (define-key evil-normal-state-map (kbd "[ d") 'flymake-goto-prev-error)
  (define-key evil-normal-state-map (kbd "] d") 'flymake-goto-next-error)
  (define-key evil-insert-state-map (kbd "C-h") 'eldoc)
  (define-key evil-normal-state-map (kbd "SPC c a") 'eglot-code-actions)

  ;; cmp
  (define-key evil-insert-state-map (kbd "C-y") 'corfu-insert)
  (define-key evil-insert-state-map (kbd "C-c") 'completion-at-point)


  ;; harpoon
  (define-key evil-normal-state-map (kbd "SPC z") 'harpoon-toggle-file)
  (define-key evil-normal-state-map (kbd "SPC a") 'harpoon-add-file)
  (define-key evil-normal-state-map (kbd "M-a") 'harpoon-go-to-1)
  (define-key evil-normal-state-map (kbd "M-o") 'harpoon-go-to-2)
  (define-key evil-normal-state-map (kbd "M-e") 'harpoon-go-to-3)
  (define-key evil-normal-state-map (kbd "M-u") 'harpoon-go-to-4)
  (define-key evil-normal-state-map (kbd "M-i") 'harpoon-go-to-5)
  (define-key evil-normal-state-map (kbd "M-d") 'harpoon-go-to-6)


  ;; misc
  (define-key evil-normal-state-map (kbd "SPC w w") 'maximize-window)
  (define-key evil-normal-state-map (kbd "C-x C-c") 'compile)
  (define-key evil-normal-state-map (kbd "C-x C-r") 'recompile))
