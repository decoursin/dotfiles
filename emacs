(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
	  package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
	  package-archives)
(package-initialize)

;;;;;;; Evil
(require 'evil)
; Evil-leader
(require 'evil-leader)

(global-evil-leader-mode) ;enable global-evil-leader-mode before evil-mode
(evil-mode 1)

(evil-leader/set-leader ",")

(evil-leader/set-key "sh" 'shell); ,sh open shell

(evil-leader/set-key "do" 'delete-other-windows); delete all windows but the current one
(evil-leader/set-key "clb" 'delete-window); ,clb close buffer

(evil-leader/set-key "w" 'save-buffer); ,w write
(evil-leader/set-key "f" 'find-file); ,f

;;; buffers
(evil-leader/set-key "bb" 'buffer-menu); ,b buffer menu current window
(evil-leader/set-key "bs" 'switch-to-buffer); ,bs buffer switch
;(evil-leader/set-key "bn" 'list-buffers); ,bn buffer new window

;;; tabs
(global-evil-tabs-mode t)
(evil-leader/set-key "tn" 'elscreen-create); ,tn tabnew
(evil-leader/set-key "clt" 'elscreen-kill); ,clt tabclose
(evil-leader/set-key "te" 'evil-tabvs-tabedit); ,te tabedit


;Found here: http://stackoverflow.com/questions/8483182/evil-mode-best-practice
;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;; emacs-bash-completion
;;; try doing this again read the directions first
;https://github.com/szermatt/emacs-bash-completion
;(autoload 'bash-completion-dynamic-complete 
;  "bash-completion"
;  "BASH completion hook")
;(add-hook 'shell-dynamic-complete-functions
;  'bash-completion-dynamic-complete)

;(global-set-key (kbd ", s h") 'shell)

(show-paren-mode 1); Options-> "Highlight matchinn parens"

;http://www.unexpected-vortices.com/clojure/10-minute-emacs-for-clojure.html
;(setq-default inhibit-startup-screen t); hide welcome screen in emacs

(setq make-backup-files nil); stop making backup files

;; Always show column numbers
(setq-default column-number-mode t)

;; Display full pathname for files.
;(add-hook 'find-file-hooks
;          '(lambda ()
;             (setq mode-line-buffer-identification 'buffer-file-truename)))

;; For easy window scrolling up and down.
(global-set-key "\M-n" 'scroll-up-line)
(global-set-key "\M-p" 'scroll-down-line)

(load-theme 'zenburn t)

; Map C-x C-b to buffer-menu rather than list-buffers
; so that it's easy to get rid of no-evil buffer
(global-set-key (kbd "C-x C-b") 'buffer-menu)

; not working
;(global-set-key (kbd "C-P") 'package-list-packages)
