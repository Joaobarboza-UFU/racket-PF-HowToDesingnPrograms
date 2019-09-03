
(require 2htdp/universe)

#|
> (+ 1 1)
2
> (+ 2 2)
(* 3 3)
(- 4 2)
(/ 6 2)

4
9
2
3

> (sqr 3)
9

> (expt 2 3)
8

 >(sin 0)
0

>(cos pi)
-1.0

>  (+ 2 (+ 3 4))
9

 > (+ 2 3 4)
9

>(+ 2 (+ (* 3 3) 4))
15

>(+ 2 (+ (* 3 (/ 12 4)) 4))

15

> (+ (* 5 5) (+ (* 3 (/ 12 4)) 4))
38

> > (+ (1) (2))
#<procedure:>>
. . application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 1
  arguments...: [none]

> (+ 1 2 3 4 5 6 7 8 9 0)
45

> (* 1 2 3 4 5 6 7 8 9 0)

0

> "hello world"
"hello world"

> (string-append "hello" "world")
"helloworld"

> (string-append "hello " "world")
"hello world"

> (string-append "hello" " " "world")
"hello world"

>  (+ (string-length "helllo world") 20)
32

>  (number->string 42)
"42"

> (string->number "42")
42

> (string->number "hello world")
#f

> (and #true #true)(and #true #false) (or #true #false)(or #false #false)(not #false)
#t
#f
#t
#f
#t

> (> 10 9)
#T

> (< -1 0)
#t

> (= 42 9)
#f

>  (>= 10 10)
#t

> (<= -1 0)
#t

> (string=? "design" "tinker")
#f

> (and (or (= (string-length "hello world")
            (string->number "11"))
         (string=? "hello world" "good morning"))
     (>= (+ (string-length "hello world") 60) 80))

#f
|#

#|
> (* (image-width .) (image-height .))
1176

> (circle 10 "solid" "green")
.

> (rectangle 30 20 "outline" "blue")

.

> (overlay (circle 5 "solid" "red")
           (rectangle 20 20 "solid" "black"))
.

> (overlay (rectangle 20 20 "solid" "black")
           (circle 5 "solid" "red"))
.

> (image-width (square 10 "solid" "red"))
10

> (image-width
    (overlay (rectangle 20 20 "solid" "black")
             (circle 5 "solid" "red")))
20

> (place-image (circle 15 "solid" "red")
             50 80
             (empty-scene 100 100))
.

|#

(define (y x) (* x x))

#|

> (y 1)
1
> (y 2)
4

> (y 1)
(y 2)
(y 3)
(y 4)
(y 5)
1
4
9
16
25

> 
(empty-scene 100 60)
.


> (place-image . 50 23 (empty-scene 100 60))
.

> (place-image  .50 30 (empty-scene 100 60))
.


> (place-image  .50 40 (empty-scene 100 60))
.

|#

(define (picture-of-rocket height)
  (place-image . 50 height (empty-scene 100 60)))

#|

> (picture-of-rocket 0)
(picture-of-rocket 10)
(picture-of-rocket 20)
(picture-of-rocket 30)
(picture-of-rocket 40)
(picture-of-rocket 50)
(picture-of-rocket 60)
(picture-of-rocket 70)
.
.
.
.
.
.
.
.
|#
(define (sign x)
  (cond
    [(> x 0) 1]
    [(= x 0) 0]
    [(< x 0) -1]))

#|
> (sign 10)
1
> (sign -5)
-1
> (sign 0)
0
|#

(define (picture-of-rocket.2 height)
  (cond
    [(<= height 60)
     (place-image . 50 height
                  (empty-scene 100 60))]
    [(> height 60)
     (place-image . 50 60
                  (empty-scene 100 60))]))

#|

(picture-of-rocket 5555)
.

>  (picture-of-rocket.2 5555)
.


> (animate picture-of-rocket.2)
108

> (- 60 (/ (image-height . ) 2))
39

(place-image . 50 (- 60 (image-height .))
             (empty-scene 100 60))
.


> (place-image . 50 (- 60 (image-height .)2)
             (empty-scene 100 60))
.

|#

(define (picture-of-rocket.3 height)
  (cond
    [(<= height (- 60 (/ (image-height ) 2)))
     (place-image  50 height
                  (empty-scene 100 60))]
    [(> height (- 60 (/ (image-height ) 2)))
     (place-image  50 (- 60 (/ (image-height ) 2))
                  (empty-scene 100 60))]))



(define (picture-of-rocket.4 h)
  (cond
    [(<= h (- HEIGHT (/ (image-height ROCKET) 2)))
     (place-image ROCKET 50 h (empty-scene WIDTH HEIGHT))]
    [(> h (- HEIGHT (/ (image-height ROCKET) 2)))
     (place-image ROCKET
                  50 (- HEIGHT (/ (image-height ROCKET) 2))
                  (empty-scene WIDTH HEIGHT))]))
 
(define WIDTH 100)
(define HEIGHT 60)
(define ROCKET .)

#| > (animate picture-of-rocket.4)
185
|#

(define MTSCN  (empty-scene WIDTH HEIGHT))

(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))

(define (picture-of-rocket.5 h)
  (cond
    [(<= h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 h MTSCN)]
    [(> h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)]))
#|
> (animate picture-of-rocket.5)
140
|#

(define V 3)
(define X 50)
(define (distance t)
  (* V t))

(define (picture-of-rocket.6 t)
  (cond
    [(<= (distance t) ROCKET-CENTER-TO-TOP)
     (place-image ROCKET X (distance t) MTSCN)]
    [(> (distance t) ROCKET-CENTER-TO-TOP)
     (place-image ROCKET X ROCKET-CENTER-TO-TOP MTSCN)]))
#|
> (animate picture-of-rocket.6)
45
|#



