;; Settings for OCaml

;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

(load (concat opam-share "/emacs/site-lisp/tuareg-site-file"))

(push "~/.emacs.d/elisp/ocaml-mode" load-path)
(autoload 'caml-mode "caml" "Major mode for editing OCaml code." t)
(autoload 'run-caml "inf-caml" "Run an inferior OCaml process." t)
(autoload 'camldebug "camldebug" "Run ocamldebug on program." t)
(require 'auto-complete)

;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)

;; suppress warnings
;(setq merlin-report-warnings t)

;; ocaml-flycheck
;; (with-eval-after-load 'merlin
;;   ;; Disable Merlin's own error checking
;;   (setq merlin-error-after-save nil)
;;   ;; Enable Flycheck checker
;;   (flycheck-ocaml-setup))

(add-hook 'tuareg-mode-hook #'merlin-mode)

;; not work
;; (add-hook 'merlin-mode-hook
;; 	  '(lambda () define-key
;; 	     merlin-mode-map
;; 	     (kbd "TAB")
;; 	     'merlin-try-completion))

;; Make company aware of merlin
(require 'company)
(add-to-list 'company-backends 'merlin-company-backend)
;; Enable company on merlin managed buffers
;(add-hook 'merlin-mode-hook 'company-mode)
;; Or enable it globally:
(add-hook 'after-init-hook 'global-company-mode)
