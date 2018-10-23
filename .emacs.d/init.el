;;------------------------------------------------------------------------------------------------
;;elisp load-path
;;------------------------------------------------------------------------------------------------
(setq load-path
      (append
       (list
        (expand-file-name "./site-lisp/")
        )
       load-path))

;;add MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
;;;yasnippet setup
(eval-after-load "yasnippet"
  '(progn
     ;; companyと競合するのでyasnippetのフィールド移動は "C-i" のみにする
     (define-key yas-keymap (kbd "<tab>") nil)
     (yas-global-mode 1)))

;;------------------------------------------------------------------------------------------------
;;auto-complete
;;------------------------------------------------------------------------------------------------
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(add-to-list 'ac-modes 'c-mode)
(add-to-list 'ac-modes 'markdown-mode)
(add-to-list 'ac-modes 'nxml-mode)

(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ


;; Compile-Log の非表示
(let ((win (get-buffer-window "*Compile-Log*")))
  (when win (delete-window win)))
;; Warning の抑制
(setq byte-compile-warnings
      '(not
        free-vars
        unresolved
        callargs
        redefine
        ;; obsolete
        noruntime
        cl-functions
        interactive-only
        ;; make-local
        ))

;; 言語を日本語にする
(set-language-environment 'Japanese)
;; 極力UTF-8とする
(prefer-coding-system 'utf-8)

;; ユーザー名とメールアドレスの設定 
(setq user-full-name "shimoe"
      user-mail-address "shimoewithranobe@gmail.com")

;; 背景を透明にする(透明度合いは 95/100)
;;(set-frame-parameter nil 'alpha 95)

;; カラーテーマ
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'graham t)

;;------------------------------------------------------------------------------
;; 矩形選択
;;------------------------------------------------------------------------------
;C-Ret で矩形選択
;キーバインド操作：http://dev.ariel-networks.com/articles/emacs/part5/
(cua-mode t)
(setq cua-enable-cua-keys nil)



;; スクロールを一行ずつにする
(setq scroll-step 1)

;;----------------------------------------------------------------------------
;; minimap
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/minimap/")
(require 'minimap)
(global-set-key (kbd "C-x m") 'minimap-mode) 

;;----------------------------------------------------------------------------
;; xml-mode
;;----------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.launch\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xacro\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.urdf\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.config\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.sdf\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.world\\'" . xml-mode))

(setq indet-tab-mode nil)
(setq nxml-slash-auto-complete-flag t)

;;----------------------------------------------------------------------------
;;色々設定
;; ----------------------------------------------------------------------------
(setq make-backup-files nil) ;; バックアップファイルを生成しない
(setq auto-save-default nil)

(show-paren-mode t) ;; 対応する括弧をハイライトする

(setq inhibit-startup-message t) ;; スタート画面を表示しない


;;CMakeListsをcmake-modeで読み込む
(require 'cmake-mode); Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))
(fset 'yes-or-no-p 'y-or-n-p) ;; "yes or no" の選択を "y or n" にする

(electric-pair-mode 1) ;;auto () complete

                                        ;(setq vc-handled-backends nil) ;;なんだっけこれ

(put 'upcase-region 'disabled nil)

;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)


;; ----------------------------------------------------------------------------
;; yaml mode
;; ----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.body\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.cnoid\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))


;;----------------------------------------------------------------------------
;;terminalの色設定
(load-theme 'tango-dark t)
(custom-theme-set-faces
 'tango-dark
 `(term-color-black ((t (:foreground "#555753" :background "#555753"))))
 `(term-color-red ((t (:foreground "#EF2929" :background "#EF2929"))))
 `(term-color-green ((t (:foreground "#8AE234" :background "#8AE234"))))
 `(term-color-yellow ((t (:foreground "#FCE94F" :background "#FCE94F"))))
 `(term-color-blue ((t (:foreground "#729FCF" :background "#729FCF"))))
 `(term-color-magenta ((t (:foreground "#AD7FA8" :background "#AD7FA8"))))
 `(term-color-cyan ((t (:foreground "#34E2E2" :background "#34E2E2"))))
 `(term-color-white ((t (:foreground "#EEEEEC" :background "#EEEEEC"))))
 )


;; ----------------------------------------------------------------------------
;; yatex setup
;; ----------------------------------------------------------------------------
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq load-path
      (cons (expand-file-name
             "/usr/share/emacs24/site-lisp/yatex/")
            load-path))
(setq YaTeX-kanji-code 4)

;;自動改行禁止
(add-hook 'yatex-mode-hook'(lambda ()(setq auto-fill-function nil)))

;; C-c C-t j
(setq tex-command "platex")

;; C-c C-t b
(setq bibtex-command "pbibtex")

;; C-c C-t p
(setq dvi2-command "evince")

;;reftex-modeを有効にする
(add-hook 'yatex-mode-hook 'turn-on-reftex)

;; section型補間の規定値
(setq section-name "section")

;;テンプレ挿入
(setq YaTeX-template-file
      (expand-file-name "~/template/template.tex")) 
                                        ; 基本的なシンタックスハイライトは /usr/share/emacs/site-lisp/yatex/yatexlib.el の1400行あたりを直接弄った 

;;------------------------------------------------------------------------------
;;画面端改行切り替え
;;------------------------------------------------------------------------------
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(defun toggle-truncate-lines ()
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-x\C-l" 'toggle-truncate-lines) 

;;------------------------------------------------------------------------------
;;NULLバー
;;------------------------------------------------------------------------------

(set-scroll-bar-mode nil)
(tool-bar-mode -1)


;;----------------------------------------------------------------------------
;;画面移動
;;----------------------------------------------------------------------------
(global-set-key (kbd "C-c <left>") `windmove-left)
(global-set-key (kbd "C-c <right>") `windmove-right)
(global-set-key (kbd "C-c <up>") `windmove-up)
(global-set-key (kbd "C-c <down>") `windmove-down)


;;------------------------------------------------------------------------------
;; 行と桁の表示
;;------------------------------------------------------------------------------
(line-number-mode t)
(column-number-mode t)

(require 'linum)            ;\左に行番号表示
(global-linum-mode)

;; 選択範囲の情報表示
(defun count-lines-and-chars ()
  (if mark-active
      (format "[%3d:%4d]"
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;;------------------------------------------------------------------------------
;; 折りたたみ
;;------------------------------------------------------------------------------
(add-hook 'c++-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'c-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'scheme-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'lisp-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'python-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'arduino-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))


(define-key global-map (kbd "C-:") 'hs-toggle-hiding)


;;------------------------------------------------------------------------------------------------
;;Ricty setup
;;(set-default "Ricty Diminished")
;;------------------------------------------------------------------------------------------------
(add-to-list 'default-frame-alist '(font . "Ricty Diminished-13.5"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(YaTeX-sectioning-0 ((((class color)) (:inherit Ricty :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-1 ((((class color)) (:inherit Ricty :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-2 ((((class color)) (:inherit Ricty :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-3 ((((class color)) (:inherit Ricty :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-4 ((((class color)) (:inherit Ricty :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-5 ((((class color)) (:inherit Ricty :foreground "#19AEB9"))))
 '(YaTeX-sectioning-6 ((((class color)) (:inherit Ricty :foreground "#19AEB9"))))
 '(ac-selection-face ((t (:background "coral" :foreground "black"))))
 '(fixed-pitch ((t (:family "Ricty"))))
 '(minimap-active-region-background ((t (:background "dark slate gray"))))
 '(variable-pitch ((t (:family "Ricty")))))



;;-----------------------------------------------------------------------------------------------
;;neo tree
;;-----------------------------------------------------------------------------------------------
(require 'all-the-icons)
(require 'neotree)
;;デフォルトで起動
(setq neo-smart-open t)
;; 隠しファイルをデフォルトで表示
(setq neo-show-hidden-files t)
;; F8 でneotreeを起動
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;-----------------------------------------------------------------------------------------------
;;magit
;;-----------------------------------------------------------------------------------------------
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-automatically-delete-window t)
 '(minimap-minimum-width 10)
 '(minimap-mode nil)
 '(minimap-width-fraction 0.02)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (multi-term minimap yaml-mode all-the-icons-dired all-the-icons-gnus all-the-icons-ivy yasnippet point-undo neotree magit irony-eldoc company-irony auto-complete-clang-async auto-complete-clang auctex-latexmk all-the-icons))))



;; let "C-x C-d" dired current directory
(defun dired-here ()
  (interactive)
  (dired "."))
(global-set-key (kbd "\C-x\C-d") 'dired-here)

;;ffap-bindings
(ffap-bindings)

;;------------------------------------------------------------------------------------------------
;; for whitespace-mode
;;------------------------------------------------------------------------------------------------
(require 'whitespace)
;; see whitespace.el for more details
(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground 'whitespace-tab "#adff2f")
(set-face-background 'whitespace-tab 'nil)
(set-face-underline  'whitespace-tab t)
(set-face-foreground 'whitespace-space "#7cfc00")
(set-face-background 'whitespace-space 'nil)
(set-face-bold-p 'whitespace-space t)
(global-whitespace-mode 1)
(global-set-key (kbd "C-x w") 'global-whitespace-mode)


;;------------------------------------------------------------------------------------------------
;; markdown-mode
;;------------------------------------------------------------------------------------------------
(autoload 'markdown-mode "~/.emacs.d/markdown-mode/markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons
                       '("\\.md" . markdown-mode)
                       auto-mode-alist))

;;------------------------------------------------------------------------------------------------
;; terminal-mode
;;------------------------------------------------------------------------------------------------
(require 'multi-term)
(global-set-key (kbd "C-S-t") 'multi-term)

;; ;;------------------------------------------------------------------------------------------------
;; ;;auto  all indent
;; ;;------------------------------------------------------------------------------------------------
;; (defun all-indent ()
;;   (interactive)
;;   (mark-whole-buffer)
;;   (indent-region (region-beginning)(region-end))
;;   (point-undo)) ;;関数定義

;; (global-set-key (kbd  "C-x C-]") 'all-indent)
