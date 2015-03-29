;; Appearance settings

;; Hide tool bar
(tool-bar-mode 0)

;; Color Scheme
(if (or (eq window-system 'ns) (eq window-system 'mac))
    (load-theme 'solarized-light t)
  (load-theme 'solarized-dark t))

;; Font Setting
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

;; Show line number
(require 'linum)
(global-linum-mode t)
(setq linum-format "%d")
(setq linum-delay t)
(set-face-attribute 'linum nil :height 100)

;; Volatile highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)(require 'volatile-highlights)
(volatile-highlights-mode t)

;; Misc
(column-number-mode t)
(setq inhibit-startup-screen t)
;(global-hl-line-mode)

(show-paren-mode 1)
(setq show-paren-style 'mixed)

