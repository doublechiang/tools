(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

;; kill a buffer without question
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; set noline wrap
(set-default 'truncate-lines t)

;; disable backup
(setq backup-inhibited t)

;; disable autosave
(setq auto-save-default nil)

;; setup global tag system
(setq load-path (cons "/usr/share/emacs/site-lisp/global" load-path))
(autoload 'gtags-mode "gtags" "" t)

;; turn on which function mode, to display cursor in which function.
(which-function-mode 1)

;; enable speedbar frame when using windows
;; (when window-system  (speedbar t))

;; Identify same file name.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; open file in current position
(global-set-key (kbd "C-x C-f") 'ffap)

;; list the buffer in the same menu
(global-set-key "\C-x\C-b" 'buffer-menu)

;; auto indent
(setq c-default-style "linux" c-basic-offset 4)

;; following to install auto-complete package, point to MELPA-stable package
;; To install auto-complete package, M-x package-install [RET] auto-complete [RET] to install the package.
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; Following is the section to enable auto-compete-mode automatically
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)



