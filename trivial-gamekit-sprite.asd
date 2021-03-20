;;;; trivial-gamekit-sprites.asd

(asdf:defsystem #:trivial-gamekit-sprite
  :description "trivial-gamekit module for sprites/spritesheets"
  :author "ava fox"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:trivial-gamekit)
  :components ((:file "package")
               (:file "util")
               (:module "objects" :serial t
                :components
                ((:file "spritesheet")
                 (:file "sprite")))
               (:file "rendering")))
