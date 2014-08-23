(require 'evil-paredit)
(require 'evil-leader)
(evil-paredit-mode)
(evil-leader-mode 1)

(global-evil-leader-mode +1)

(require 'evil-exchange)
;; change default key bindings (if you want) HERE
(setq evil-exchange-key (kbd "zx"))
(evil-exchange-install)


