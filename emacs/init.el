;; Initial settings

;; Cask configuration
(require 'cask)
(cask-initialize)

;; Pallet mode
(require 'pallet)
(pallet-mode t)

;; load envs
(let ((envs '("PATH" "VIRTUAL_ENV" "GOROOT" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/init-loader")

;;;;;install-elisp
;(require 'install-elisp)
;(setq install-elisp-repository-directory "~/.emacs.d/elisp/")
