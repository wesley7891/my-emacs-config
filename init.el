;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Wesley's simple config
;;; 2022-09-12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; tsinghua mirrors
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(package-initialize) ;; You might already have this line

;;; Basic Config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq make-backup-files nil)
(global-display-line-numbers-mode)
(blink-cursor-mode 0)
(global-hl-line-mode)

(window-numbering-mode) ;; window-numbering M+1 M+2... 

(require 'use-package)

;;; Advanced Config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; auto-complete
;;;(ac-config-default)

;;; company
(add-hook 'after-init-hook 'global-company-mode)

;;; neotree
;;;(add-to-list 'load-path "~/.emacs.d/3Party/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq-default neo-show-hidden-files t)

;;; js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(require 'js2-refactor)
(require 'xref-js2)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

(define-key js-mode-map (kbd "M-.") nil)
(add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;;; rjsx-mode
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

;;; lsp-mode
(require 'lsp-mode)

;;(add-hook 'javascript-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)
;;(add-hook 'java-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
;;(add-hook 'rust-mode-hook #'lsp)

;;; lsp-ui
(use-package lsp-ui
  :after lsp-mode
  :bind
  (("C-c d" . lsp-ui-peek-find-definitions)
   ("C-c r" . lsp-ui-peek-find-references))
  :custom
  ((lsp-ui-sideline-show-diagnostics t)
   (lsp-ui-sideline-show-hover t)
   (lsp-ui-sideline-show-code-actions t)
   (lsp-ui-sideline-delay 0.2)
   (lsp-ui-sideline-update-mode nil)
   (lsp-ui-doc-enable t)
   (lsp-ui-doc-position 'at-point)
   (lsp-ui-doc-delay 0.2)
   (lsp-ui-doc-show-with-cursor t)
   (lsp-ui-doc-show-with-mouse nil)
   (lsp-ui-imenu-window-width 30)
   (lsp-ui-imenu-custom-mode-line-format t)
   (lsp-ui-imenu-auto-reference t)))

;;; flycheck
(global-flycheck-mode)

;;; org-mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-agenda-files '("/home/wesley/org-notes/gtd/inbox.org"
			 "/home/wesley/org-notes/gtd/gtd.org"
			 "/home/wesley/org-notes/gtd/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
			       (file+headline) "/home/wesley/org-notes/gtd/inbox.org" "Tasks")))

;;; rust-mode
(require 'rust-mode)

;;; handlebars
(require 'handlebars-mode)

;;; keyfreq
;;; keyfreq-show to see how many times you used a command
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;;; smex
;;; smex is a tool to show many commands
(require 'smex)
(smex-initialize)

;;; bind some keys
(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-x") 'smex-major-mode-commands)
