(require 'bind-key)

(bind-key* "C-l" 'helm-swoop)

(bind-key "ESC" 'helm-keyboard-quit helm-swoop-map)
(bind-key "ESC" 'helm-keyboard-quit helm-map)
(bind-key* "C-x f" 'helm-mini)
(bind-key* "H-s" 'fixup-whitespace)
(bind-key* "C-c C-v" 'evil-mode)
(bind-key* "M-z" 'dired-jump)
(bind-key* "M-x" 'helm-M-x)
(unbind-key "C-z")




;;
;; If you want to rebind a key only in a particular key, use:
;;
;;   (bind-key "C-c x" 'my-ctrl-c-x-command some-other-mode-map)
;;
;; To unbind a key within a keymap (for example, to stop your favorite major
;; mode from changing a binding that you don't want to override everywhere),
;; use `unbind-key':
;;
;;   (unbind-key "C-c x" some-other-mode-map)
;;
;; To bind multiple keys at once, or set up a prefix map, a
;; `bind-keys' macro is provided.  It accepts keyword arguments, see
;; its documentation for detailed description.
;;
;; To add keys into a specific map, use :map argument
;;
;;    (bind-keys :map dired-mode-map
;;               ("o" . dired-omit-mode)
;;               ("a" . some-custom-dired-function))
;;
;; To set up a prefix map, use :prefix-map and :prefix
;; arguments (both are required)
;;
;;    (bind-keys :prefix-map my-customize-prefix-map
;;               :prefix "C-c c"
;;               ("f" . customize-face)
;;               ("v" . customize-variable))
;;
;; You can combine all the keywords together.
;; Additionally, :prefix-docstring can be specified to set
;; documentation of created :prefix-map variable.
;;
;; To bind multiple keys in a `bind-key*' way (to be sure that your bindings
;; will not be overridden by other modes), you may use `bind-keys*' macro:
;;
;;    (bind-keys*
;;     ("C-o" . other-window)
;;     ("C-M-n" . forward-page)
;;     ("C-M-p" . backward-page))
;;
;; After Emacs loads, you can see a summary of all your personal keybindings
;; currently in effect with this command:
;;
;;   M-x describe-personal-keybindings
;;
;; This display will tell you if you've overriden a default keybinding, and
;; what the default was.  Also, it will tell you if the key was rebound after
;; your binding it with `bind-key', and what it was rebound it to.

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width        2)
(setq         tab-stop-list    (number-sequence 4 120 4))

;; setup junk whitespace types for when whitespace mode is active
(setq whitespace-style '(face tabs trailing))
