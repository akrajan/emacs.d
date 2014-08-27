(require 'package)

(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Initialize all the ELPA packages (what is installed using the packages commands)
(package-initialize)

;; Enable my Canadian French keyboard layout

;; ;; Set bigger fonts

;; (set-face-attribute 'default nil :family "Anonymous Pro" :height 140)
(set-default-font "Inconsolata 15")
;; (set-face-attribute 'default nil :font "Courier New-12")
;; (set-frame-font  "Courier New-12" nil t)


;; ;; Cider &amp; nREPL
(add-hook 'clojure-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "<em>nrepl</em>")

;; ;; General Auto-Complete
;; (require 'auto-complete-config)
;; (setq ac-delay 0.3)
;; (setq ac-quick-help-delay 0.3)
;; (ac-config-default)
;; (ac-set-trigger-key "C-c TAB")

;; ;; ac-nrepl (Auto-complete for the nREPL)
(require 'ac-nrepl)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-to-list 'ac-modes 'cider-mode)
(add-to-list 'ac-modes 'cider-repl-mode)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

;; ;; Popping-up contextual documentation
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; ;; paredit
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
;; ;; Show parenthesis mode
(show-paren-mode 1)

;; ;; rainbow delimiters
(global-rainbow-delimiters-mode)

;; ;; Noctilus Theme
(load-theme 'zenburn t)

;; ;; Switch frame using F8
(global-set-key [f8] 'other-frame)
(global-set-key [f7] 'paredit-mode)
(global-set-key [f9] 'cider-jack-in)
(global-set-key [f11] 'speedbar)

;; ;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq default-directory (concat (getenv "HOME") "/"))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-linum-mode 0)
(add-hook 'after-save-hook 'whitespace-cleanup)

(setq-default indent-tabs-mode nil)


(defalias 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-directory-alist `(("." . "~/.saves")))
(setq nrepl-hide-special-buffers t)
