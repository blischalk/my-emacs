(load-theme 'tomorrow-night-bright t)
(load-theme 'monokai t)
(load-theme 'hipster t)
(load-theme 'seti t)

;; My customizations

;; Enable ido mode
(ido-mode 1)

;; Enable Evil mode
(evil-mode 1)

;; Fix Evil mode open below
(defun evil-open-below (count)
  "Insert a new line below point and switch to Insert state.
The insertion will be repeated COUNT times."
  (interactive "p")
  (evil-insert-newline-below)
  (setq evil-insert-count count
        evil-insert-lines t
        evil-insert-vcount nil)
  (evil-insert-state 1)
  (add-hook 'post-command-hook #'evil-maybe-remove-spaces))

;; Add ability to increase / decrease font size
;; Seems to be broken.  Investigate.
;;(when window-system
;;  (set-exec-path-from-shell-PATH)
;;  (global-set-key (kbd "s-=") 'text-scale-increase)
;;  (global-set-key (kbd "s--") 'text-scale-decrease))


(setq-default indent-tabs-mode nil) ; use spaces

;; Set the default tab width
(setq-default tab-width 2)

;; Set the indention level for javascript
(setq js-indent-level 2)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq css-indent-offset 2)

(setq-default evil-shift-width 2)

;; Set the default font size
(set-face-attribute 'default nil :height 150)

;; Enable key chords
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;; Highlight lines longer than 80 chars
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Helm
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)


;; Add mit scheme
(setq scheme-program-name "/usr/local/bin/scheme")


;; clj-refactor
(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-t")))

(require 'calendar)
(defun insdate-insert-current-date (&optional omit-day-of-week-p)
    "Insert today's date using the current locale.
  With a prefix argument, the date is inserted without the day of
  the week."
    (interactive "P*")
    (insert (calendar-date-string (calendar-current-date) nil
				  omit-day-of-week-p)))
(global-set-key "\C-x\M-d" `insdate-insert-current-date)

(defun my/ruby-minor-modes ()
  (electric-indent-mode))

(add-hook 'ruby-mode-hook 'my/ruby-minor-modes)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2))

(add-hook 'web-mode-hook  'my-web-mode-hook)


; Speclj
(put-clojure-indent 'describe 1)
(put-clojure-indent 'describe-server 1)
(put-clojure-indent 'it 1)
(put-clojure-indent 'before-all 1)
(put-clojure-indent 'after-all 1)
(put-clojure-indent 'before 1)
(put-clojure-indent 'after 1)


(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(mapc (lambda (s) (put-clojure-indent s 'defun))
      '(GET* PUT* DELETE* POST* PATCH* context))

(mapc (lambda (s) (put-clojure-indent s 1))
      '(describe describe-server it before-all after-all before after
                init-state render render-state will-mount did-mount should-update
                will-receive-props will-update did-update display-name will-unmount
                describe-with-db describe-with-server swaggered))


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-enable-auto-pairing )

(require 'yasnippet)
(yas-global-mode 1)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)


(setq processing-location "/usr/bin/processing-java")
(setq processing-application-dir "/Applications/Processing.app")
(setq processing-sketchbook-dir "~/Documents/Processing")
(setq processing-output-dir "/tmp")
