(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (doom-molokai)))
 '(custom-safe-themes
   (quote
    ("be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "0ad7f1c71fd0289f7549f0454c9b12005eddf9b76b7ead32a24d9cb1d16cbcbd" "6231254e74298a1cf8a5fee7ca64352943de4b495e615c449e9bb27e2ccae709" "3e3a1caddeee4a73789ff10ba90b8394f4cd3f3788892577d7ded188e05d78f4" "845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "a339f231e63aab2a17740e5b3965469e8c0b85eccdfb1f9dbd58a30bdad8562b" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" default)))
 '(fci-rule-color "#6272a4")
 '(helm-completion-style (quote emacs))
 '(helm-swoop-pre-input-function (lambda nil (interactive) ""))
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(js-indent-level 2)
 '(js-jsx-indent-level 2)
 '(js-jsx-syntax t)
 '(js-switch-indent-offset 2)
 '(objed-cursor-color "#ff5555")
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (helm-rg multiple-cursors company rjsx-mode tide avy docker magit ido-vertical-mode hydra helm-swoop helm-projectile)))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(package-initialize)
;; completion framwork
(require 'helm)
(helm-mode 1)
(require 'helm-projectile)
(require 'projectile)
(require 'helm-config)
(projectile-global-mode)
(helm-projectile-on)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;; shortcut keys
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c rg") 'helm-rg)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-c SPC") 'avy-goto-char-timer)
(global-set-key (kbd "C-c f") 'helm-projectile-find-file)
(global-set-key (kbd "C-c s") 'projectile-run-shell)

;; Company
(global-company-mode 1)
;; remove ui stuff
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; general completion
(require 'ido)
(ido-mode t)
(require 'hydra)
(defhydra aarons/smerge-hydra (:color pink :hint nil)
  "
^Navigate^       ^Selection^
^^^^^^^^----------------------
_n_: next       _m_: mine
_N_: next-file  _o_: other
_p_: prev       _a_: all
  ^^            _u_: upper
  ^^            _l_: lower
"
  ("n" smerge-next)
  ("N" smerge-vc-next-conflict)
  ("p" smerge-prev)
  ("m" smerge-keep-mine)
  ("o" smerge-keep-other)
  ("a" smerge-keep-all)
  ("u" smerge-keep-upper)
  ("l" smerge-keep-lower)
  ("q" nil "quit" :color blue))
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(require 'recentf)
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
;; enable recent files mode.
(recentf-mode t)
; 50 files ought to be enough.
(setq recentf-max-saved-items 50)
(defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
      (interactive)
        (if (find-file (ido-completing-read "Find recent file: " recentf-list))
	        (message "Opening file...")
	  (message "Aborting")))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'rjsx-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(setq typescript-indent-level 2)
