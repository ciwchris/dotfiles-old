;; setup package manager
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; turn on evil
(evil-mode 1) 

;; use projectile globally
(projectile-global-mode)

;; style emacs
(if window-system
    (progn
      (scroll-bar-mode -1)
      (tool-bar-mode -1)
      (menu-bar-mode -1)))
(load-theme 'solarized-dark t)
(set-default-font "terminus 14")

;; change tabs to spaces and make tabstop 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; auto indent on return
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Prefer splitting windows vertically
;;(setq split-width-threshold 20)

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/tmp/backup")))

;; no startup msg
(setq inhibit-startup-message t)

;; Use ibuffer instead of list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; enable MRU list
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; set up paredit to run automatically for lisp and scheme
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

;; Relative line numbers
(require 'linum-relative)
(global-linum-mode 1)

;; Autocomplete mode
(require 'auto-complete)
(add-hook 'prog-mode-hook 'auto-complete-mode)
;; add eldoc to view argument list of functions
(add-hook 'clojure-mode-hook 'eldoc-mode)

;; setup org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; setting up org mode agendas
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"))

;; don't show the cider connection and server buffers
(setq nrepl-hide-special-buffers t)

;; use eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Clever hack so lambda shows up as λ
;; (font-lock-add-keywords
;;     'emacs-lisp-mode
;;     '(("(\\(lambda\\)\\>"
;;         (0 (prog1 ()
;;             (compose-region (match-beginning 1)
;;                 (match-end 1)
;;                 ?λ))))))

;; Don't go to REPL buffer when starting Cider:
;; not defined now??
;;(setq cider-repl-pop-to-buffer-on-connect nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(line-number-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
