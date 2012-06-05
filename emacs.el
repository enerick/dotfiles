;;;;;Code
(setq user-full-name "enerick")

(setq load-path (cons "~/.emacs.d/elisp" (cons "~/.emacs.d/auto-install" load-path)))

;;;;;Settings
(set-language-environment 'Japanese)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8-unix)

; 行番号の表示
(push "~/.emacs.d/elisp" load-path)
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
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(if (and (boundp 'window-system) window-system)
    (when (string-match "XEmacs" emacs-version)
       	(if (not (and (boundp 'mule-x-win-initted) mule-x-win-initted))
            (require 'sym-lock))
       	(require 'font-lock)))
;;;;;}}}

;;;;;Scheme関連
(setq scheme-program-name "gosh")
(require 'cmuscheme)

;; ウィンドウを２つに分けて、
;; 一方でgoshインタプリタを実行するコマンドを定義します。
(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
	(get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))
;; そのコマンドをCtrl-cSで呼び出します。
(define-key global-map
			"\C-cs" 'scheme-other-window)

;; 直前/直後の括弧に対応する括弧を光らせます。
(show-paren-mode 1)
;色が付く部分
;(setq show-paren-style 'parenthesis) ; かっこに色が付く
;(setq show-paren-style 'expression)  ; かっこ内に色が付く
(setq show-paren-style 'mixed)       ; その両方

;; 括弧の補完
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;; 以下はインデントの定義です。
(put 'and-let* 'scheme-indent-function 1)
(put 'begin0 'scheme-indent-function 0)
(put 'call-with-client-socket 'scheme-indent-function 1)
(put 'call-with-input-conversion 'scheme-indent-function 1)
(put 'call-with-input-file 'scheme-indent-function 1)
(put 'call-with-input-process 'scheme-indent-function 1)
(put 'call-with-input-string 'scheme-indent-function 1)
(put 'call-with-iterator 'scheme-indent-function 1)
(put 'call-with-output-conversion 'scheme-indent-function 1)
(put 'call-with-output-file 'scheme-indent-function 1)
(put 'call-with-output-string 'scheme-indent-function 0)
(put 'call-with-temporary-file 'scheme-indent-function 1)
(put 'call-with-values 'scheme-indent-function 1)
(put 'dolist 'scheme-indent-function 1)
(put 'dotimes 'scheme-indent-function 1)
(put 'if-match 'scheme-indent-function 2)
(put 'let*-values 'scheme-indent-function 1)
(put 'let-args 'scheme-indent-function 2)
(put 'let-keywords* 'scheme-indent-function 2)
(put 'let-match 'scheme-indent-function 2)
(put 'let-optionals* 'scheme-indent-function 2)
(put 'let-syntax 'scheme-indent-function 1)
(put 'let-values 'scheme-indent-function 1)
(put 'let/cc 'scheme-indent-function 1)
(put 'let1 'scheme-indent-function 2)
(put 'letrec-syntax 'scheme-indent-function 1)
(put 'make 'scheme-indent-function 1)
(put 'multiple-value-bind 'scheme-indent-function 2)
(put 'match 'scheme-indent-function 1)
(put 'parameterize 'scheme-indent-function 1)
(put 'parse-options 'scheme-indent-function 1)
(put 'receive 'scheme-indent-function 2)
(put 'rxmatch-case 'scheme-indent-function 1)
(put 'rxmatch-cond 'scheme-indent-function 0)
(put 'rxmatch-if  'scheme-indent-function 2)
(put 'rxmatch-let 'scheme-indent-function 2)
(put 'syntax-rules 'scheme-indent-function 1)
(put 'unless 'scheme-indent-function 1)
(put 'until 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)
(put 'while 'scheme-indent-function 1)
(put 'with-builder 'scheme-indent-function 1)
(put 'with-error-handler 'scheme-indent-function 0)
(put 'with-error-to-port 'scheme-indent-function 1)
(put 'with-input-conversion 'scheme-indent-function 1)
(put 'with-input-from-port 'scheme-indent-function 1)
(put 'with-input-from-process 'scheme-indent-function 1)
(put 'with-input-from-string 'scheme-indent-function 1)
(put 'with-iterator 'scheme-indent-function 1)
(put 'with-module 'scheme-indent-function 1)
(put 'with-output-conversion 'scheme-indent-function 1)
(put 'with-output-to-port 'scheme-indent-function 1)
(put 'with-output-to-process 'scheme-indent-function 1)
(put 'with-output-to-string 'scheme-indent-function 1)
(put 'with-port-locking 'scheme-indent-function 1)
(put 'with-string-io 'scheme-indent-function 1)
(put 'with-time-counter 'scheme-indent-function 1)
(put 'with-signal-handlers 'scheme-indent-function 1)
(put 'with-locking-mutex 'scheme-indent-function 1)
(put 'guard 'scheme-indent-function 1)
