;; Settings for editing

(require 'anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line nil
		    :background "white" :foreground "dark sea green"
		    :weight 'bold)

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-replace-to-string-separator " => "))


(require 'ace-isearch)
(global-ace-isearch-mode +1)

;; fly-check-pos
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

