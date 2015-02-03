;; basic formatting
;; always use spaces
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
;; Include these folders
(let ((default-directory (expand-file-name "~/.emacs.d/include/")))
  (normal-top-level-add-subdirs-to-load-path))

;; disable that fucking emacs logo startup
(setq inhibit-startup-message t)

;; show matching parens
(show-paren-mode t)

;; instead of typing yes or no type y or n.
(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'custom-theme-load-path "~/.emacs.d/include/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/include/themes/emacs-color-theme-solarized")

(global-hl-line-mode 1)
;(set-face-background 'hl-line "gray80")
(set-face-foreground 'highlight nil)
(interactive)

(column-number-mode 1)

;; nobody wants to be nagged by a blinking cursor
(blink-cursor-mode 0)

;; no more ear bleeding beeps or annoying block on the screen
(setq ring-bell-function 'ignore)

;; no more scroll bar
(scroll-bar-mode 0)

;; get rid of useless menus
(tool-bar-mode 0)
(menu-bar-mode 0)

(defun tmp/change-indent-oicr ()
  (interactive)
  (setq indent-tabs-mode t)
  (setq tab-width 4)
  (add-to-list 'cperl-style-alist
               '("oicr"
                 (cperl-auto-newline                         . nil)
                 (cperl-brace-offset                         . 0)
                 (cperl-close-paren-offset                   . 0)
                 (cperl-continued-brace-offset               . 0)
                 (cperl-continued-statement-offset           . 0)
                 (cperl-extra-newline-before-brace           . nil)
                 (cperl-extra-newline-before-brace-multiline . nil)
                 (cperl-indent-level                         . 4)
                 (cperl-indent-parens-as-block               . t)
                 (cperl-label-offset                         . 0)
                 (cperl-merge-trailing-else                  . t)
                 (cperl-tab-always-indent                    . t)))
  (cperl-set-style "oicr"))

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(add-to-list 'default-frame-alist
	     '(font . "menlo-regular-12"))

(fset 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook 'tmp/change-indent-oicr)

;; I have a modern laptop, increase gc threshold
(setq gc-cons-threshold 20000000)

;; Set a better window size

;; Nice size for the default window
(defun get-default-height ()
  (/ (- (display-pixel-height) 120)
	 (frame-char-height)))
(add-to-list 'default-frame-alist '(width . 190))
(add-to-list 'default-frame-alist (cons 'height (get-default-height)))

; Using in Emacs 24.0
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

; style I want to use in c++ mode
(c-add-style "my-style" 
	     '("stroustrup"
	       (indent-tabs-mode . nil)        ; use spaces rather than tabs
	       (c-basic-offset . 4) ))

(defun my-c++-mode-hook ()
  (c-set-style "my-style"))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(dolist (hook '(latex-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

; org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (quote ("~/git/org"))) ; where all org todo files go.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(background-color "#042028")
 '(background-mode dark)
 '(cursor-color "#708183")
 '(custom-enabled-themes (quote (gandalf)))
 '(custom-safe-themes
   (quote
    ("c739f435660ca9d9e77312cbb878d5d7fd31e386a7758c982fa54a49ffd47f6e" "8d6fb24169d94df45422617a1dfabf15ca42a97d594d28b3584dc6db711e0e0b" "08efabe5a8f3827508634a3ceed33fa06b9daeef9c70a24218b70494acdf7855" "49eea2857afb24808915643b1b5bd093eefb35424c758f502e98a03d0d3df4b1" "058eeda70c6a8e702da4c7037c582f727887f5ab49a401247eac40aece97060d" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "2cc9ecf74dd307cdf856a2f47f6149583d6cca9616a0f4ecc058bafa57e4ffa3" "7a00b0710bb2e400d33a925f94b1cd8cfa2281f864ac9506b9046703e0045d66" "68cdf52ba0081b876e926ebbad36f308405178d13335ccbb5bc41b9e94028a65" "ffbc43cd2b8c0f11d6093575bd9b34fa95cdc1366939d37aef309b7d90b340fe" "451d4d48b28ac3195fcfc0f4e42c294b6fda8b7e10b37f48b72e6d974a67834f" default)))
 '(fci-rule-color "#383838")
 '(foreground-color "#708183")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
