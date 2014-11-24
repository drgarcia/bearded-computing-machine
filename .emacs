(set-keyboard-coding-system nil)
(global-hl-line-mode 1)
(set-face-background hl-line-face "gray10")
(interactive)

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
	     '(font . "Inconsolata-14"))

(fset 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook 'tmp/change-indent-oicr)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (hipster)))
 '(custom-safe-themes (quote ("451d4d48b28ac3195fcfc0f4e42c294b6fda8b7e10b37f48b72e6d974a67834f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
