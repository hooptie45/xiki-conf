;; show wrap guide
(require 'fill-column-indicator)
(require 'evil-paredit)
(evil-paredit-mode)
(paredit-mode)
(setq fci-rule-column np-wrap-limit)
(fci-mode)

(local-set-key (kbd "C-c v w") 'fci-mode)

;; show junk whitespace

(smartparens-mode)

(sp-with-modes (list major-mode)
  ; remove pairs I use snippets for
  (sp-local-pair "do"     nil :actions :rem)
  (sp-local-pair "begin"  nil :actions :rem)
  (sp-local-pair "def"    nil :actions :rem)
  (sp-local-pair "class"  nil :actions :rem)
  (sp-local-pair "module" nil :actions :rem)
  (sp-local-pair "case"   nil :actions :rem)
  (sp-local-pair "for"    nil :actions :rem)
  (sp-local-pair "if"     nil :actions :rem)
  (sp-local-pair "unless" nil :actions :rem)
  (sp-local-pair "while"  nil :actions :rem)
  (sp-local-pair "until"  nil :actions :rem))

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-c v s") 'np/toggle-program-spelling)

;; command shortcuts
(local-set-key (kbd "C-M-n") 'np/other-window-next-line)
(local-set-key (kbd "C-M-p") 'np/other-window-previous-line)

(local-set-key (kbd "C-c =") 'np/align=)

(local-set-key (kbd "C-c t s") 'np/toggle-string-type)

(local-set-key (kbd "C-c t t") 'np/toggle-ruby-test)
(local-set-key (kbd "C-c t b") 'np/toggle-ruby-block-type)
(local-set-key (kbd "C-c t r") 'np/toggle-ruby-regex-type)
(local-set-key (kbd "C-c t S") 'np/toggle-ruby-string-and-symbol)
(local-set-key (kbd "C-c t h") 'np/toggle-ruby-hash-type)

(local-set-key (kbd "C-c x") 'xmp)  ; (requires:  gem install rcodetools)
