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
(set-default-font "Inconsolata 13")
;; (set-face-attribute 'default nil :font "Courier New-12")
;; (set-frame-font  "Courier New-12" nil t)


;; ;; Cider &amp; nREPL
(add-hook 'clojure-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "<em>nrepl</em>")

;; ;; General Auto-Complete
(require 'auto-complete-config)
(ac-config-default)
(require 'auto-complete)
;; (setq ac-delay 0.3)
;; (setq ac-quick-help-delay 0.3)
;; (ac-config-default)
(ac-set-trigger-key "C-c TAB")

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
(add-hook 'lisp-interaction-mode-hook 'paredit-mode)
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode 'enable-paredit-mode)

;; ;; Show parenthesis mode
(show-paren-mode 1)

;; ;; rainbow delimiters
;; (global-rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ruby-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode 'rainbow-delimiters-mode)

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
 '(ac-modes
   (quote
    (cider-repl-mode cider-mode emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode)))
 '(cider-lein-command "/Users/arun/bin/lein")
 '(global-auto-complete-mode t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-directory-alist `(("." . "~/.saves")))
(setq nrepl-hide-special-buffers t)
(setq cider-repl-display-in-current-window t)
(setq nrepl-buffer-name-show-port t)
(winner-mode 1)
(windmove-default-keybindings)
(global-linum-mode 1)

(load "~/.emacs.d/erc.el")
(load "~/.emacs.d/my-extensions.el")

; Projectile mode
(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(setq tab-width 2 indent-tabs-mode nil)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))
(global-set-key (kbd "C-x g") 'magit-status)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)


; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'ruby-block)
(require 'ruby-end)
(add-to-list 'auto-mode-alist '("\\.yml$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))

(defun projectile-rails-bindings ()
  (define-key projectile-rails-mode-map (kbd "s-m")   'projectile-rails-find-model)
  (define-key projectile-rails-mode-map (kbd "s-c")   'projectile-rails-find-controller)
  (define-key projectile-rails-mode-map (kbd "s-v")   'projectile-rails-find-view)
  (define-key projectile-rails-mode-map (kbd "s-RET") 'projectile-rails-goto-file-at-point)
  (define-key projectile-rails-mode-map (kbd "C-c g")  projectile-rails-mode-goto-map))

(add-hook 'projectile-rails-mode-hook 'projectile-rails-bindings)
(add-to-list 'auto-mode-alist '("\\log\\$", auto-revert-tail-mode))


; Javascript setup
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

(defun paredit-js-mode-init ()
  (setq js2-highlight-level 3)
  (define-key js-mode-map "{" 'paredit-open-curly)
  (define-key js-mode-map "}" 'paredit-close-curly-and-newline)
  (define-key js-mode-map "\"" 'paredit-doublequote))
(add-hook 'js2-mode-hook 'paredit-js-mode-init)


; Yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20140821.38")
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)
