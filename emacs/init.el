(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq-default auto-save-default nil)
(setq-default byte-compile-warnings nil)
(setq-default create-lockfiles nil)
(setq-default inhibit-startup-screen t)
(setq-default initial-scratch-message nil)
(setq-default make-backup-files nil)
(setq-default mode-line-format "  %b")
(setq-default package-enable-at-startup nil)

(menu-bar-mode -1)
(tool-bar-mode -1)

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(use-package one-themes
             :ensure t
             :config
             (load-theme 'one-dark t))

(use-package evil
             :ensure t
             :init
             (setq evil-want-keybinding nil)
             :config
             (evil-mode 1))

(use-package evil-collection
             :after evil
             :ensure t
             :config
             (evil-collection-init))

(use-package ivy
             :config
             (ivy-mode))

(use-package magit
             :ensure t
             :config
             (setq-default git-commit-summary-max-length 50)
             (magit)
             (delete-other-windows))
