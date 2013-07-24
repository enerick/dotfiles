;;;;;Code
(setq user-full-name "enerick")

;;;;;;Settings
(set-language-environment 'Japanese)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8-unix)

;;;;Load path
(setq load-path (cons "~/.emacs.d/elisp" (cons "~/.emacs.d/auto-install" load-path)))
(setq custom-theme-load-path (cons "~/.emacs.d/theme/" (cons "~/.emacs.d/theme/emacs-color-theme-solarized" custom-theme-load-path)))

;;;;;Color
(if (eq window-system 'ns)
    (load-theme 'solarized-light t)
  (load-theme 'solarized-dark t))

;;;;;Font
(cond
 ((or (eq window-system 'ns) (eq window-system 'mac))
  (when (>= emacs-major-version 23)
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0208
     '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0212
     '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
    (set-fontset-font
     (frame-parameter nil 'font)
     'mule-unicode-0100-24ff
     '("monaco" . "iso10646-1"))
     )))

; 行番号の表示
(require 'linum)
(global-linum-mode t)
(setq linum-format "%d ")

; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)

;;;;;バックアップファイルつくらない
(setq make-backup-files nil)
(setq auto-save-default nil)

;optionをメタキーに
(setq mac-esc-key-is-meta nil) ; コマンドキーをメタにしない
(setq mac-option-modifier 'meta)   ; オプションキーをメタに
(setq mac-command-modifier 'super) ; コマンドキーを Super に
(setq mac-pass-control-to-system t) ; コントロールキーを Mac ではなく Emacs に渡す
(setq mac-pass-option-to-system t)

;カーソルキーをhjklに
(global-set-key "\C-h" 'backward-char)
(global-set-key "\C-j" 'next-line)
(global-set-key "\C-k" 'previous-line)
(global-set-key "\C-l" 'forward-char)

(global-set-key "\C-d" 'kill-line)

;文字サイズの拡大縮小
(global-set-key (kbd "s-+") (kbd "C-x C-+"))
(global-set-key (kbd "s-_") (kbd "C-x C--"))

;;;;;install-elisp
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;;;;;auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)

(auto-install-compatibility-setup);互換性確保

;;;;;Anything
(require 'anything-startup)
(define-key global-map [(super a)] 'anything)

;;;;;YaTeX
(push "~/.emacs.d/elisp/yatex" load-path)
(setq auto-mode-alist (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;;;;;OCaml{{{
; tuareg mode hook (use caml-mode-hook instead if you use caml-mode)
(add-hook 'tuareg-mode-hook 
		  '(lambda ()
			 (local-set-key "\C-c;" 'ocamlspot-query)
			 (local-set-key "\C-c\C-t" 'ocamlspot-type)
			 (local-set-key "\C-c\C-y" 'ocamlspot-type-and-copy)
			 (local-set-key "\C-c\C-u" 'ocamlspot-use)
			 (local-set-key "\C-ct" 'caml-types-show-type)))
;;;;;tuareg-mode
;;; append-tuareg.el - Tuareg quick installation: Append this file to .emacs.

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "ocamldebug" "Run the Caml debugger" t)

(if (and (boundp 'window-system) window-system)
    (when (string-match "XEmacs" emacs-version)
       	(if (not (and (boundp 'mule-x-win-initted) mule-x-win-initted))
            (require 'sym-lock))
       	(require 'font-lock)))
;;;;;}}}

;;;;;Coq(Proof General)
(load-file "~/.emacs.d/elisp/ProofGeneral/generic/proof-site.el")
;(setenv "PATH" (concat "/usr/local/bin/" (getenv "PATH")))
(push "/usr/local/bin/" exec-path)

;;;;;;Haskell
(push "~/.emacs.d/elisp/haskell-mode" load-path)
(require 'haskell-mode)
(require 'haskell-cabal)
(setq auto-mode-alist (cons `("\\.hs$" . haskell-mode) auto-mode-alist))
(setq auto-mode-alist (cons `("\\.lhs$" . literate-haskell-mode) auto-mode-alist))
(setq auto-mode-alist (cons `("\\.cabal$" . haskell-cabal-mode) auto-mode-alist))

(setq interpreter-mode-alist (cons `("runghc" . haskell-mode) interpreter-mode-alist))
(setq interpreter-mode-alist (cons `("runhaskell" . haskell-mode) interpreter-mode-alist))

(require 'inf-haskell)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#1c1c1c")
 '(background-mode dark)
 '(cursor-color "#808080")
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#808080")
 '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-haskell-indentation)))
 '(haskell-program-name "ghci"))
; indentation

; ghc-mod



;;;;;;Egison
; egison-mode
(autoload 'egison-mode "egison-mode" "Major mode for editing Egison code." t)
(setq auto-mode-alist
	  (cons `("\\.egi$" . egison-mode) auto-mode-alist))

;; 直前/直後の括弧に対応する括弧を光らせる
(show-paren-mode 1)
;色が付く部分
;(setq show-paren-style 'parenthesis) ; かっこに色が付く
;(setq show-paren-style 'expression)  ; かっこ内に色が付く
(setq show-paren-style 'mixed)       ; その両方

;; 括弧の補完
;(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;(setq skeleton-pair 1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
