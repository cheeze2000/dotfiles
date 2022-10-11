(declare-function elpaca-generate-autoloads "elpaca")
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(when-let ((elpaca-repo (expand-file-name "repos/elpaca/" elpaca-directory))
           (elpaca-build (expand-file-name "elpaca/" elpaca-builds-directory))
           (elpaca-target (if (file-exists-p elpaca-build) elpaca-build elpaca-repo))
           (elpaca-url  "https://www.github.com/progfolio/elpaca.git")
           ((add-to-list 'load-path elpaca-target))
           ((not (file-exists-p elpaca-repo)))
           (buffer (get-buffer-create "*elpaca-bootstrap*")))
  (condition-case-unless-debug err
      (progn
        (unless (zerop (call-process "git" nil buffer t "clone" elpaca-url elpaca-repo))
          (error "%s" (list (with-current-buffer buffer (buffer-string)))))
        (byte-recompile-directory elpaca-repo 0 'force)
        (require 'elpaca)
        (elpaca-generate-autoloads "elpaca" elpaca-repo)
        (kill-buffer buffer))
    ((error)
     (delete-directory elpaca-directory 'recursive)
     (with-current-buffer buffer
       (goto-char (point-max))
       (insert (format "\n%S" err))
       (display-buffer buffer)))))
(require 'elpaca-autoloads)
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca (elpaca :host github :repo "progfolio/elpaca"))
(setq package-enable-at-startup nil)

(elpaca use-package (require 'use-package))

(setq-default auto-save-default nil)
(setq-default byte-compile-warnings nil)
(setq-default create-lockfiles nil)
(setq-default confirm-kill-emacs #'y-or-n-p)
(setq-default elpaca-hide-status-during-build t)
(setq-default inhibit-startup-screen t)
(setq-default initial-scratch-message nil)
(setq-default make-backup-files nil)
(setq-default mode-line-format "  %b")

(menu-bar-mode -1)
(tool-bar-mode -1)
(xterm-mouse-mode)

(defvar simple-magit-starting-dir default-directory)

(elpaca-use-package zenburn-theme
  :config
  (load-theme 'zenburn t)
  (set-face-attribute 'vertical-border nil
    :foreground (face-attribute 'default :background)))
(elpaca-use-package ivy
  :config
  (ivy-mode))
(elpaca-use-package magit
  :config
  (setq-default git-commit-summary-max-length 50)
  (setq-default split-width-threshold 0)
  (setq-default split-height-threshold nil)
  (magit-status simple-magit-starting-dir)
  (delete-other-windows))
