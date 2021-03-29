;;;; rendering.lisp

(in-package :gamekit.sprite)

(defun draw-sprites (&rest sprites)
  (loop :for s :in sprites
        :do (draw-sprite s)))

(defmethod draw-sprite :before ((this sprite))
  (with-slots (tick current-frame frames frame-length animate state) this
    (when animate
      (setf tick (mod+1 tick frame-length))
      (when (zerop tick)
        (setf current-frame (mod+1 current-frame (length (if (alistp frames)
                                                             (agetf frames state)
                                                             frames))))))))

(defmethod draw-sprite ((this sprite))
  (with-slots (coordinates rotation render
               spritesheet frames current-frame
               scale state flip-h flip-v) this
    (when render
      (with-slots (image) spritesheet
        (gamekit:with-pushed-canvas ()
          (multiple-value-bind (origin size) (resolve-frame spritesheet (elt (if (alistp frames)
                                                                                 (agetf frames state)
                                                                                 frames)
                                                                             current-frame))
            (unless (zerop rotation)
              (gamekit:translate-canvas (x coordinates) (y coordinates))
              (gamekit:rotate-canvas rotation))
            (gamekit:scale-canvas (x scale) (y scale))
            (let ((draw-pos (gamekit:div coordinates scale)))
              ;; this is so our coordinates are consistant
              (when flip-h (setf (x draw-pos) (- (x draw-pos))))
              (when flip-v (setf (y draw-pos) (- (y draw-pos))))
              (gamekit:draw-image (if (zerop rotation)
                                      
                                      draw-pos           
                                      gamekit::+origin+)
                                  image
                                  :origin origin
                                  :mirror-x flip-h
                                  :mirror-y flip-v
                                  :width (x size)
                                  :height (y size)))))))))
