;; Settings for LaTeX

;; YaTeX
(push "~/.emacs.d/elisp/yatex" load-path)
(setq auto-mode-alist (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-kanji-code 4)
