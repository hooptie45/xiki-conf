;; Idea from Ryan Davis:
;; http://blog.zenspider.com/blog/2013/06/my-emacs-setup-packages.html

(require 'package)

(dolist (repo '(("elpa"      . "http://tromey.com/elpa/")
                ("marmalade" . "http://marmalade-repo.org/packages/")
                ("melpa"     . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives repo))

(defun np/package-refresh-and-install (name)
  "Ensure we have a fresh package list, then install."
  (package-refresh-contents)
  (package-install name))

(defun np/package-install-unless-installed (name)
  "Install a package by name unless it is already installed."
  (or (package-installed-p name) (np/package-refresh-and-install name)))

(defun np/package-version-for (package)
  "Get the version of a loaded package."
  (package-desc-vers (cdr (assoc package package-alist))))

(defun np/package-delete-by-name (package)
  "Remove a package by name."
  (package-delete (symbol-name package)
                  (package-version-join (np/package-version-for package))))

(defun np/package-delete-unless-listed (packages)
  "Remove packages not explicitly declared."
  (let ((packages-and-dependencies (np/packages-requirements packages)))
    (dolist (package (mapcar 'car package-alist))
      (unless (memq package packages-and-dependencies)
        (np/package-delete-by-name package)))))

(defun np/packages-requirements (packages)
  "List of dependencies for packages."
  (delete-dups (apply 'append (mapcar 'np/package-requirements packages))))

(defun np/package-requirements (package)
  "List of recursive dependencies for a package."
  (let ((package-info (cdr (assoc package package-alist))))
     (cond ((null package-info) (list package))
           (t
            (np/flatten
             (cons package
                   (mapcar 'np/package-requirements
                           (mapcar 'car (package-desc-reqs package-info)))))))))

(defun np/package-install-and-remove-to-match-list (&rest packages)
  "Sync packages so the installed list matches the passed list."
  (package-initialize)
  (condition-case nil ;; added to handle no-network situations
      (mapc 'np/package-install-unless-installed packages)
    (error (message "Couldn't install package. No network connection?")))
  (np/package-delete-unless-listed packages))

(np/package-install-and-remove-to-match-list
 'ace-jump-mode
 'ag
 'bind-key
 'coffee-mode
 'color-theme-sanityinc-tomorrow
 'elisp-slime-nava
 'cyberpunk-theme
 'dash
 'dimin
 'diminish
 'dired-details
 'dired-single
 'evil
 'elisp-slime-nav
 'evil-paredit
 'exec-path-from-shell
 'expand-region
 'f
 'fill-column-indicator
 'fiplr
 'flx-ido
 'git-timemachine
 'haml-mode
 'idomenu
 'inf-ruby
 'key-chords
 'magit
 'markdown-mode
 'multiple-cursors
 'paredit
 'powerline-evil
 'projectile
 'ruby-compilation
 's
 'scss-mode
 'smartparens
 'undo-tree
 'window-number
 'workgroups
 'yagist
 'yaml-mode
 'magit-gh-pulls
 'evil-exchange
 'yasnippet
 'auto-complete
 'evil-exchange
)

;; vendored packages
(np/load-init-file "np/vendor/rcodetools")
(np/load-init-file "np/vendor/scad-mode")

(add-to-list 'load-path (expand-file-name "np/vendor/helm" user-emacs-directory))
(np/load-init-file "np/vendor/helm/helm-ring")
(np/load-init-file "np/vendor/helm/helm-config")
(np/load-init-file "np/vendor/helm/helm-tags")

(add-to-list 'load-path (expand-file-name "np/vendor/helm-swoop" user-emacs-directory))
(np/load-init-file "np/vendor/helm-swoop/helm-swoop")

(np/load-init-file "np/vendor/powerline/powerline-themes")



(add-to-list 'load-path (expand-file-name "np/vendor/powerline" user-emacs-directory))
(np/load-init-file "np/vendor/powerline/powerline")

(add-to-list 'load-path (expand-file-name "np/vendor/evil-leader" user-emacs-directory))
(np/load-init-file "np/vendor/evil-leader/evil-leader")

(add-to-list 'load-path (expand-file-name "np/vendor/evil-paredit" user-emacs-directory))
(np/load-init-file "np/vendor/evil-paredit/evil-paredit")





