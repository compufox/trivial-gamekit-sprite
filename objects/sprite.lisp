;;;; sprite.lisp

(in-package :gamekit.sprite)

(defclass sprite ()
  ((tick :initform 0)
   (coordinates :initarg :coordinates
                :initform (vec2 0 0)
                :accessor coordinates)
   (rotation :initarg :rotation
             :initform 0
             :accessor rotation)
   (scale :initarg :scale
          :accessor scale)
   (render :initform t
           :initarg :render
           :accessor render)
   (animate :initform nil
            :initarg :animate
            :accessor animate)
   (spritesheet :initform nil
                :initarg :spritesheet
                :reader spritesheet)
   (frames :initarg :frames
           :accessor frames)
   (current-frame :initform 0
                  :initarg :current-frame
                  :accessor current-frame)
   (frame-length :initform 0
                 :initarg :frame-length
                 :accessor frame-length)))

(defun make-sprite (spritesheet &key (coordinates gamekit::+origin+) (render t) (rotation 0)
                                  animate (frame-length 0) frames (scale (vec2 1 1)))
  (make-instance 'sprite :spritesheet spritesheet :frames frames :coordinates coordinates
                         :render render :rotation rotation :frame-length frame-length
                         :animate animate :scale scale))

