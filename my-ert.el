;;; my-ert.el --- Helpers for ERT                    -*- lexical-binding: t; -*-

;; Copyright (C) 2021  kga

;; Author: kga <kga@Thinkpad-OpenSUSE>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:
(defun my-ert-org-buffer (buffer-text &optional func)
  "Useful for testing `org-mode' functions in ert.

BUFFER-TEXT is the initial state of the `org-mode' buffer.

FUNC is what is ran after creating the buffer."
  (my-ert-temp-buffer buffer-text func 'org-mode))


(defun my-ert-temp-buffer (buffer-text &optional func mode-func)
  "Useful for testing text in a temp buffer.

BUFFER-TEXT is the initial state of the temp.

FUNC is what is ran after creating the buffer."
  (with-temp-buffer
    (insert buffer-text)

    (goto-char (point-min))
    (when mode-func
      (funcall mode-func))

    (if func
        (funcall func)
      (buffer-string))))



(defun my-ert-reload-feature (feature &optional feature-path)
  "Reload FEATURE.

Optionally provide feature's FEATURE-PATH."
  (if (featurep feature)
      (unload-feature feature t))
  (require feature feature-path))


(defun my-ert-nil-func (&rest _)
  "Set functions to this to disable them."
  nil)


(provide 'my-ert)
;;; my-ert.el ends here
