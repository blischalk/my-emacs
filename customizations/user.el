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

;; Add ability to increase / decrease font size
;; Seems to be broken.  Investigate.
;;(when window-system
;;  (set-exec-path-from-shell-PATH)
;;  (global-set-key (kbd "s-=") 'text-scale-increase)
;;  (global-set-key (kbd "s--") 'text-scale-decrease))

;; Set the default tab width
(setq tab-width 2)

;; Set the indention level for javascript
(setq js-indent-level 2)

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
;;(require 'helm-config)
;;(global-set-key (kbd "C-c h") 'helm-mini)
;;(helm-mode 1)


;; Add mit scheme
(setq scheme-program-name "/usr/local/bin/scheme")
(global-set-key (kbd "M-x") 'helm-M-x)


;; clj-refactor
;;(require 'clj-refactor)
;;(add-hook 'clojure-mode-hook (lambda ()
 ;;                              (clj-refactor-mode 1)
                               ;; insert keybinding setup here
  ;;                             ))

(require 'calendar)
(defun insdate-insert-current-date (&optional omit-day-of-week-p)
    "Insert today's date using the current locale.
  With a prefix argument, the date is inserted without the day of
  the week."
    (interactive "P*")
    (insert (calendar-date-string (calendar-current-date) nil
				  omit-day-of-week-p)))
(global-set-key "\C-x\M-d" `insdate-insert-current-date)
