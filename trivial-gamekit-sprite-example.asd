;;;; trivial-gamekit-sprite-example.asd

(asdf:defsystem #:trivial-gamekit-sprite-example
  :description "trivial-gamekit module for sprites/spritesheets"
  :author "ava fox"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:trivial-gamekit #:trivial-gamekit-sprite)
  :components ((:module "example"
                :components ((:file "main")))))
