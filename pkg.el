(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defvar pkg-is-packages-refreshed nil)

(defun pkg-refresh-once ()
  (when (not pkg-is-packages-refreshed)
    (setq pkg-is-packages-refreshed t)
    (package-refresh-contents)))

(defun pkg-install-once (package)
  (when (not (package-installed-p package))
    (pkg-refresh-once)
    (package-install package)))

(defun pkg-install-multi (packages)
  (dolist (package packages)
    (pkg-install-once package)))
