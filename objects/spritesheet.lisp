;;;; spritesheet.lisp

(in-package :gamekit.sprite)

(defclass spritesheet ()
  ((image :initarg :image
          :reader image)
   (frames :initform (make-hash-table))))

(defmethod resolve-frame ((sheet spritesheet) frame)
  "returns origin position and size (both vec2) for FRAME from SHEET"
  (let ((frame-data (gethash frame (slot-value sheet 'frames) (vec2 0 0))))
    (values (first frame-data) (second frame-data))))

(defmacro define-frames (spritesheet &rest forms)
  "define frames avaliable in SPRITESHEET

FORMS is a list of of form (IDENTIFIER VEC2-ORIGIN VEC2-SIZE)"
  `(with-slots (frames) ,spritesheet
     ,@(loop :for (id . values) :in forms
             :collect `(setf (gethash ,id frames) (list ,@values)))))

(defun make-spritesheet (image &rest frames)
  (let ((sheet (make-instance 'spritesheet :image image)))
    (loop :for (id . values) :in frames
          :do (setf (gethash id (slot-value sheet 'frames)) values))
    sheet))
