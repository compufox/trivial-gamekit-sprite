# trivial-gamekit-sprite
### _ava fox_

trivial-gamekit module for sprites

## API

`(make-spritesheet image &rest frames)`

creates and returns a spritesheet based off of IMAGE, with FRAMES

each form in FRAMES should be of the form (IDENTIFIER VEC2-ORIGIN VEC2-SIZE)

please see `example/main.lisp` for an example

---

`(make-sprite spritesheet &key (coordinates gamekit::+origin+) (render t) (rotation 0) animate (frame-length 0) (scale (vec2 1 1)) frames)`

creates and returns a sprite

COORDINATES the location of the sprite

ROTATION the rotation of the sprite (in radians)

SCALE the size of the sprite

FRAMES the sprite's frames from SPRITESHEET 

RENDER whether or not to draw the sprite

ANIMATE whether or not the sprite should animate (increments through FRAMES one by one)

FRAME-LENGTH how long each frame should last when animating

---

`(draw-sprite sprite)`

draws a SPRITE

---

`(draw-sprites &rest sprites)`

draws SPRITES

---

`(deg->rad degrees)`

converts DEGREES to radians

---

`(rad->deg radians)`

converts RADIANS to degrees

---

accessors exported: 
`coordinates` `rotation` `render` `animate`
`spritesheet` `current-frame` `frame-length`
`image` `scale`

## License

MIT

