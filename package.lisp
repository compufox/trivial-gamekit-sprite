;;;; package.lisp

(defpackage #:trivial-gamekit-sprite
  (:use #:cl)
  (:nicknames :gamekit.sprite)
  (:import-from :gamekit :vec2 :x :y)
  (:export :make-sprite :make-spritesheet
           :coordinates :rotation :render :animate
           :spritesheet :current-frame :frame-length
           :image :scale :state
           
           :deg->rad :rad->deg
           :draw-sprite :draw-sprites))
