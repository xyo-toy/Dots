; File: ~/.emacs
; Very basic Emacs configuration.
; Features: General stuff, interface customizations,
;           C mode and whitespacd mode configuration.


; General Emacs configuration
(setq debug-on-error t ; show stack trace on config error
      vc-follow-symlinks t) ; always follow symlink"

;; Add loading path
(add-to-list 'load-path "~/.emacs.d/custom_package")

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(counsel flycheck dap-mode lsp-ivy lsp-treemacs lsp-ui lsp-mode magit ivy projectile flycheck-package spacemacs-theme evil evil-nerd-commenter tuareg)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tuareg-font-lock-governing-face ((t (:foreground "color-136" :weight bold)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Require column maker
;;(require 'column-marker)

;; Highlight column 80 in C mode:
;;(add-hook 'erlang-mode-hook (lambda () (interactive) (column-marker-1 80)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; WindMove binding setup
(windmove-default-keybindings 'meta)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Clang stuff
(require 'clang-format)
(setq clang-format-style "file")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Lsp hook
(require 'lsp-mode)
(add-hook 'cc-mode-hook #'lsp)

;; Lsp / Treemacs synchronisation
(lsp-treemacs-sync-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Ccls hook
(require 'ccls)
(setq ccls-executable "/usr/bin/ccls")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Kill hello buffer
(setq inhibit-startup-screen t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Ivy + Counsel shrotcut suggestion
(counsel-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; WindMove setup
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Colorscheme and themes path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Basic interface configuration
(tool-bar-mode -1) ; hide tool bar (GUI only)
(scroll-bar-mode -1) ; hide scroll bar (GUI only)
(menu-bar-mode -1) ; hide menu bar
(global-linum-mode) ; show line numbers
(column-number-mode) ; show column number in the modeline

; Disable tabulations (repeated to ensure compatibility with any major mode)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

; Basic C configuration
(setq c-basic-offset 4 ; spaces of indentation
      c-default-style "bsd" ; sort of fits the coding style
      fill-column 80) ; 80 columns rule

(setq whitespace-style '(face ; show ...
                         tabs tab-mark ; the tabulations,
                         lines-tail ; lines too long (> fill-column characters),
                         trailing)) ; and trailing spaces
(global-whitespace-mode)
