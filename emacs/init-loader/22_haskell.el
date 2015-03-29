;; Settings for Haskell

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
