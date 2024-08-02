;; -*- emacs-mode  -*- ;;

;;;;;;;;;;;;;;;;;;;;;
;; global settings ;;
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

;;;;;;;;;;;;;
;; for X11 ;;
(when window-system
  (add-to-list 'default-frame-alist '(height . 36))
  (add-to-list 'default-frame-alist '(width . 120)))

;;;;;;;;;;;;;;;;;;;
;; font settings ;;

;; https://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; (set-default-font "Ricty Diminished Discord 11")
; (set-default-font "Noto Sans CJK JP 12") ;; almost good, but whitespace is unreadable.
; (set-default-font "Noto Sans Mono 11") ;; mono cannot chose with 'light' word.
; (set-default-font "Noto Sans Mono CJK JP 12") ;; mono cannot chose with 'light' word.
; (set-default-font " VL PGothic 12") ;; mono cannot chose with 'light' word.
(add-to-list 'default-frame-alist '(font . "Noto Sans Mono CJK JP 12" ))
(set-face-attribute 'default t :font "Noto Sans Mono CJK JP 12" )

;; keyboard mappings
(global-set-key "\C-h" 'delete-backward-char)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mode settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; add the default directory to the loadpath
(add-to-list 'load-path "~/lib/elisp/")

;; ispell-mode
(setq-default ispell-program-name "aspell") 

;; asciidoc-mode from https://github.com/sensorflo/adoc-mode
(autoload 'adoc-mode "adoc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode))
;; update timestamp for adoc-mode
(add-hook 'adoc-mode-hook (lambda()
			    (require 'time-stamp)
			    (add-hook 'before-save-hook 'time-stamp)
			    (custom-set-variables
			     '(time-stamp-active t)
			     '(time-stamp-start "date: ") 
			     '(time-stamp-format "%Y-%02m-%02dT%02H:%02M:%02S%:z")
			     '(time-stamp-end "$"))))
