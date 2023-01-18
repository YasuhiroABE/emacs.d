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
; (set-default-font "Ricty Diminished Discord 11")
; (set-default-font "Noto Sans CJK JP 12") ;; almost good, but whitespace is unreadable.
; (set-default-font "Noto Sans Mono 11") ;; mono cannot chose with 'light' word.
(set-default-font "Noto Sans Mono CJK JP 12") ;; mono cannot chose with 'light' word.
; (set-default-font " VL PGothic 12") ;; mono cannot chose with 'light' word.

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
			    (setq time-stamp-active t)
			    (setq time-stamp-start "date: ")
			    (setq time-stamp-format "%04y-%02m-%02dT%02H:%02M:%02S+09:00")
			    (setq time-stamp-end "$")
			    ))

