

;; (require 'scratch-palette)
;; (scratch-palette-popup)
(evil-leader/set-key
  "e" 'find-file
  "f" 'helm-mini
  "j" 'dired-jump
  "R" 'helm-show-kill-ring
  "g" 'magit-status
  "l" 'magit-log-mode
  "w" 'wg-switch-to-workgroup

  "c" 'wg-dired
  "t" 'projectile-toggle-between-implementation-and-test
  "b" 'switch-to-buffer
  "k" 'kill-buffer)
