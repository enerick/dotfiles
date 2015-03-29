;;;;;Code
(setq user-full-name "enerick")

;;;;;Settings
(set-language-environment 'Japanese)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8-unix)

;;;;;Load path
(setq load-path (cons "~/.emacs.d/elisp/" (cons "~/.emacs.d/auto-install" load-path)))
(setq custom-theme-load-path (cons "~/.emacs.d/theme/" (cons "~/.emacs.d/theme/emacs-color-theme-solarized" custom-theme-load-path)))

; バックアップファイルつくらない
(setq make-backup-files nil)
(setq auto-save-default nil)
