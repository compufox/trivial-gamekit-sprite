(defpackage :trivial-gamekit-sprite-example
  (:nicknames :gamekit.sprite.example)
  (:use :cl :gamekit :gamekit.sprite)
  (:export :run))

(in-package :gamekit.sprite.example)

(defgame example () ()
  (:viewport-title "gamekit.sprite example"))

(register-resource-package :keyword
  (asdf:system-relative-pathname :trivial-gamekit-sprite-example "example/"))

;; define our image, spritesheet, and the available frames in the spritesheet
(define-image :sheet1 "sheet.png")
(defparameter *sheet1*
  (make-spritesheet :sheet1
                    (list :frame1 (vec2 0 0) (vec2 20 20))
                    (list :frame2 (vec2 20 0) (vec2 20 20))))

;; define our sprite and which frames it can reference (must be a list)
(defparameter *sprite1*
  (make-sprite *sheet1* :frames '(:frame1 :frame2)))

(defmethod gamekit:draw ((this example))
  ;; clear the screen
  (draw-rect gamekit::+origin+ 800 600 :fill-paint (vec4 1 1 1 1))

  ;; draw our sprites
  (draw-sprite *sprite1*))

(defun run ()
  (gamekit:start 'example))
