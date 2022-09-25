;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Wesley's simple config
;;; 2022-09-12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Basic Config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq make-backup-files nil)
(global-display-line-numbers-mode)
(blink-cursor-mode 0)
(window-numbering-mode) ;; window-numbering M+1 M+2... 

(require 'use-package)

;;; tsinghua mirrors
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(package-initialize) ;; You might already have this line

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
;;(require 'lsp-mode)

;;(add-hook 'javascript-mode-hook #'lsp)
;;(add-hook 'python-mode-hook #'lsp)
;;(add-hook 'java-mode-hook #'lsp)
;;(add-hook 'c-mode-hook #'lsp)
;;(add-hook 'c++-mode-hook #'lsp)
;;(add-hook 'rust-mode-hook #'lsp)

;;; lsp-ui
;;(use-package lsp-ui)
;(lsp-ui-sideline-show-diagnostics-mode)

;;; flycheck
;;(use-package flycheck
;;  :ensure t
;;  :init (global-flycheck-mode))

;;; org-mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-agenda-files '("/home/wesley/org-notes/gtd/inbox.org"
			 "/home/wesley/org-notes/gtd/gtd.org"
			 "/home/wesley/org-notes/gtd/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
			       (file+headline) "/home/wesley/org-notes/gtd/inbox.org" "Tasks")))
