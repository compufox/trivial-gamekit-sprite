;;;; util.lisp

(in-package :gamekit.sprite)

(declaim (inline mod+1 deg->rad rad->deg alistp))

(defun mod+1 (number divisor)
  (declare (optimize (speed 3))
           (type fixnum number divisor))
  (mod (1+ number) divisor))

(defun deg->rad (degrees)
  "convert DEGREES to radians"
  (* (/ pi 180) degrees))

(defun rad->deg (radians)
  "convert RADIANS to degrees"
  (/ (* 180 radians) pi))

(defun alistp (alist)
  "checks if ALIST is an alist"
  (and (listp alist)
       (every #'consp alist)))

(defun agetf (place indicator &key (key #'identity) (test #'equalp))
  (cdr (assoc indicator place :test test :key key)))
