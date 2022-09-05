;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq make-backup-files nil)
(global-display-line-numbers-mode)
(blink-cursor-mode 0)

;;; tsinghua mirrors
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(package-initialize) ;; You might already have this line

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; advance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; auto-complete
(ac-config-default)

;;; neotree
(add-to-list 'load-path "~/.emacs.d/3Party/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;; js development config
