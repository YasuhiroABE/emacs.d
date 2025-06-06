;; -*- emacs-mode  -*- ;;
;;
;; Reference:
;; * https://qiita.com/conao3/items/347d7e472afd0c58fbd7
;;;;;;

;; Copyright (C) 2020 Naoya Yamashita
;; Copyright (C) 2025 Yasuhiro ABE

;; Author: Naoya Yamashita <conao3@gmail.com>
;; Modifier: Yasuhiro ABE <yasu@yasundial.org>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; My init.el.

;;; Code:
;;
;; this enables this running method
;;   emacs -q -l ~/.debug.emacs.d/{{pkg}}/init.el
;;
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("org"   . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu"   . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    ;; (leaf el-get :ensure t) ;; should be replaced by :vc
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))

;; 個人の設定はここから変更する

(leaf leaf
  :config
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t
    :custom ((imenu-list-size . 30)
             (imenu-list-position . 'left))))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

(leaf copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el")
  :config
  (leaf editorconfig
    :ensure t
    )
  (leaf s
    :ensure t
    )
  (leaf dash
    :ensure t
    )
  (add-to-list 'copilot-indentation-alist '(prog-mode 2))
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode 2))
  (add-to-list 'copilot-indentation-alist '(special-mode 2))
  ;; make a list of specific modes to enable copilot functionality
  (add-to-list 'copilot-indentation-alist '(yaml-mode 2))
  :hook
  (prog-mode-hook .  copilot-mode)
  :bind
  (copilot-completion-map
   ("<tab>" . copilot-accept-completion)
   ("M-f" . copilot-accept-completion-by-word)
   ("C-M-f" . copilot-accept-completion-by-paragraph)
   ("M-n" . copilot-accept-completion-by-line)
   ("C-M-n" . copilot-next-completion)
   ("C-M-p" . copilot-previous-completion)
   )
  (copilot-mode-map
   ("M-i" . copilot-complete)
   )
  )

(leaf ddskk
  :ensure t)

(leaf leaf-convert
  :setq ((inhibit-startup-message . t))
  :setq	((initial-scratch-message . nil)))

(leaf leaf-convert
  :bind (("" . delete-backward-char)))

(leaf leaf-convert
  :config
  (add-to-list 'default-frame-alist
	       '(font . "Noto Sans Mono CJK JP 12")))

(leaf leaf-convert
  :when window-system
  :config
  (add-to-list 'default-frame-alist
	       '(height . 36))
  (add-to-list 'default-frame-alist
	       '(width . 135)))

(leaf leaf-convert
  :config
  (set-face-attribute 'default t :font "Noto Sans Mono CJK JP 12"))

(leaf leaf-convert
  :setq ((wakatime-api-key . "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
	 (wakatime-cli-path . "/home/yasu/.wakatime/wakatime-cli"))
  :config
  (global-wakatime-mode))

(leaf adoc-mode
  :ensure t
  :mode ("\\.adoc\\'" . adoc-mode))

(leaf markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :hook (markdown-mode-hook . (lambda ()
                                (setq tab-width 4)
                                (setq indent-tabs-mode nil)
				(setq c-basic-offset 4)
                                (setq fill-column 80)
                                (setq show-trailing-whitespace t))))

;;; ここから下は変更しない

(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(copilot macrostep leaf-tree leaf-convert blackout el-get hydra leaf-keywords)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; init.el ends here
