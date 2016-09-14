(require 'jka-compr)
(load-theme 'tomorrow-night-bright t)
(load-theme 'hipster t)
(load-theme 'seti t)
(load-theme 'monokai t)

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
(put-clojure-indent 'context 2)
(put-clojure-indent 'describe-server 1)
(put-clojure-indent 'it 1)
(put-clojure-indent 'before-all 1)
(put-clojure-indent 'after-all 1)
(put-clojure-indent 'before 0)
(put-clojure-indent 'after 0)
(put-clojure-indent 'around 1)
(put-clojure-indent 'GET 2)
(put-clojure-indent 'POST 2)
(put-clojure-indent 'PUT 2)
(put-clojure-indent 'DELETE 2)

(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(mapc (lambda (s) (put-clojure-indent s 2))
      '(GET* POST* PUT* DELETE* PATCH* context*))

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

(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rake?\\'" . ruby-mode))

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

;; OrgMode PlantUML Stuff
(org-babel-do-load-languages
  'org-babel-load-languages
  '((sh . t)
    (clojure . t)
    (plantuml . t)))

(defun my-org-confirm-babel-evaluate (lang body)
    (and
    (not (string= lang "lisp"))
    (not (string= lang "emacs-lisp"))
    (not (string= lang "plantuml"))
    (not (string= lang "clojure"))))
  (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(setq org-plantuml-jar-path
      (expand-file-name "~/bin/plantuml.jar"))

;; Enable font resizing
(when window-system
    (global-set-key (kbd "s-=") 'text-scale-increase)
    (global-set-key (kbd "s--") 'text-scale-decrease))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; Show the manual entry for a item
(global-set-key  [f1] (lambda () (interactive) (manual-entry (current-word))))

;; Fix c indentation
(setq c-default-style "linux"
          c-basic-offset 4)

;; Convert json to a clojure map
(defun json->clj-map ()
  (interactive)
  (when (region-active-p)
    (replace-regexp "null" "nil"
                    nil (region-beginning) (region-end))
    (replace-regexp "\\(\"\\([A-z0-9_-]+\\)\"\s*:\\)" ":\\2 "
                    nil (region-beginning) (region-end))
    (replace-regexp "," ""
                    nil (region-beginning) (region-end))))

(global-set-key (kbd "C-c C-j h") 'json->clj-map)

;; Enable paredit for Racket
(add-hook 'racket-mode-hook
          '(lambda ()
             (paredit-mode)
             (local-set-key (kbd "C-j") 'racket-send-last-sexp)
             (local-set-key (kbd "C-c C-j") 'racket-send-region)
             (local-set-key (kbd "C-c C-s") 'racket-repl)
             (local-set-key (kbd "C-c C-p") 'clipboard-yank)))

;; Enable company mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; Steve Yegge's stuff
;; https://sites.google.com/site/steveyegge2/effective-emacs
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)


(global-set-key "\C-cms" 'magit-status)
(global-set-key "\C-cml" 'magit-log)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)


(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell
         (replace-regexp-in-string
          "[ \t\n]*$" ""
          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))


;; Add ability to increase / decrease font size
;; Seems to be broken.  Investigate.
(when window-system
  (set-exec-path-from-shell-PATH)
  ;;(global-set-key (kbd "s-=") 'text-scale-increase)
  ;;(global-set-key (kbd "s--") 'text-scale-decrease)
  )
