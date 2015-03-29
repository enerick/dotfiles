;; Global set keys

;; optionをメタキーに
(setq mac-esc-key-is-meta nil) ; コマンドキーをメタにしない
(setq mac-option-modifier 'meta) ; オプションキーをメタに
(setq mac-command-modifier 'super) ; コマンドキーを Super に
(setq mac-pass-control-to-system t) ; コントロールキーを Mac ではなく Emacs に渡す
(setq mac-pass-option-to-system t)

; カーソルキーをhjklに
(global-set-key "\C-h" 'backward-char)
(global-set-key "\C-j" 'next-line)
(global-set-key "\C-k" 'previous-line)
(global-set-key "\C-l" 'forward-char)

; 文字サイズの拡大縮小
(global-set-key (kbd "s-+") (kbd "C-x C-+"))
(global-set-key (kbd "s-_") (kbd "C-x C--"))

; バッファを再読み込み
(global-set-key (kbd "s-r") (kbd "C-x C-v RET"))

;; copy & paste
(global-set-key (kbd "s-c") 'copy-region-as-kill)
(global-set-key (kbd "s-v") 'yank)
;; Save buffer by Command-s
(global-set-key (kbd "s-s") (kbd "C-x C-s"))
;; Quit by Command-q
(global-set-key (kbd "s-q") (kbd "C-x C-c"))
;; Create/Close a flame (window)
(global-set-key (kbd "s-n") 'make-frame-command)
(global-set-key (kbd "s-w") 'delete-frame)
;; Undo
(global-set-key (kbd "s-z") 'undo)
;; Kill buffer
(global-set-key (kbd "s-k") 'kill-buffer)
;; Goto line
(global-set-key (kbd "s-l") 'goto-line)
;; Eval expr
(global-set-key (kbd "s-e") 'eval-expression)
;; Move to Next/Prev window
(global-set-key (kbd "s-}") (kbd "C-x o"))
(global-set-key (kbd "s-{") (kbd "C-- C-x o"))

(defun smart-beginning-of-line ()
  "Move to beginning of line, or line text"
  (interactive)
  (let ((pt (point)))
    (beginning-of-line-text)
    (when (eq pt (point))
      (beginning-of-line))))
(global-set-key (kbd "C-a") 'smart-beginning-of-line)
