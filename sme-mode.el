;;; sme-mode.el --- Major mode for SSC/CPQ solution modeling
;;
;; Copyright (C) 2015 Michael Josephson (michael@mertisconsulting.com)
;; Copyright (C) xxxx SAP SE
;;
;; Author: Michael Josephson (michael@mertisconsulting.com)
;; Maintainer: Michael Josephson (michael@mertisconsulting.com)
;; URL: https://github.com/mjj55409/sme-mode.git
;; Keywords: languages
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; GNU Emacs major mode for editing CPQ/SSC solution modeling files.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;; Customization
(defgroup sme nil
  "SAP CPQ modeling in Emacs"
  :prefix "sme-"
  :group 'languages
  :link '(url-link :tag "Github" "https://github.com/mjj55409/sme-mode.git")
  :link '(emacs-commentary-link :tag "Commentary" "sme-mode"))

(defcustom sme-indent-level 2
  "Indentation of SME statements."
  :type 'integer
  :group 'sme
  :safe 'integerp)

(defcustom SME-indent-tabs-mode nil
  "Indentation can insert tabs in SME mode if this is non-nil."
  :type 'boolean
  :group 'sme
  :safe 'booleanp)

;;; Version information
(defun sme-version (&optional show-version)
  "Get the SME Mode version as string.
If called interactively or if SHOW-VERSION is non-nil, show the
version in the echo area and the messages buffer.
The returned string includes both, the version from package.el
and the library version, if both a present and different.
If the version number could not be determined, signal an error,
if called interactively, or if SHOW-VERSION is non-nil, otherwise
just return nil."
  (interactive (list t))
  (let ((version (pkg-info-version-info 'sme-mode)))
    (when show-version
      (message "SME Mode version: %s" version))
    version))

;;; Font locking
(defvar sme-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; Strings
    (modify-syntax-entry ?' "\"" table)
    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?\' "\"'"  table)
    (modify-syntax-entry ?\" "\"\"" table)
    ;; C-style comments
    (modify-syntax-entry ?/ ". 14b" table)
    (modify-syntax-entry ?* ". 23b" table)
    ;; Fix various operators and punctionation.
    (modify-syntax-entry ?<  "." table)
    (modify-syntax-entry ?>  "." table)
    (modify-syntax-entry ?&  "." table)
    (modify-syntax-entry ?|  "." table)
    (modify-syntax-entry ?%  "." table)
    (modify-syntax-entry ?=  "." table)
    (modify-syntax-entry ?+  "." table)
    (modify-syntax-entry ?-  "." table)
    (modify-syntax-entry ?\; "." table)
    ;; Our parenthesis, braces and brackets
    (modify-syntax-entry ?\( "()" table)
    (modify-syntax-entry ?\) ")(" table)
    (modify-syntax-entry ?\{ "(}" table)
    (modify-syntax-entry ?\} "){" table)
    (modify-syntax-entry ?\[ "(]" table)
    (modify-syntax-entry ?\] ")[" table)
    table)
  "Syntax table in use in `sme-mode' buffers.")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ssc\\'" . sme-mode))

(define-derived-mode sme-mode prog-mode "SME Mode"
  :syntax-table sme-mode-syntax-table
  (font-lock-fontify-buffer))

(provide 'sme-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sme-mode.el ends here
