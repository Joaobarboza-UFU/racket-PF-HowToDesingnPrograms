
; > (sin 0)
; 0; 
; > (sin 90)
; 0.8939966636005579
; > (sin 30)
; -0.9880316240928618
; >  (/ 4 6)
; 2/3
; > (sqrt 2)
; 1.4142135623730951
; > (sqrt 5)
; 2.23606797749979 

(define x 3)
(define y 4)
(define (distancia-1 x y)
  (+ (sqr x)(sqr y)))
(define (distancia-origem x y)
  (sqrt(distancia-1 x y)))

; > (distancia-origem 12 5)
; 13
; (string-append "what a " "lovely " "day" " 4 BSL")
; "what a lovely day 4 BSL"

(define prefix "hello")
(define suffix "world")
(define (concatenar-pre-su x y)
  (string-append x "_" y))

; (concatenar-pre-su prefix suffix)
; "hello_world"
; (string-length prefix)
; 5
; > (+ (string-length "hello world") 20)
; 31
; (+ (string-length 42) 1)
; string-length: expects a string, given 42
; (+ (string-length "42") 1)
; 3

(define str "helloworld")
(define ind "0123456789")
(define i 5)


;> (circle 10 "solid" "green")
;.
;> (rectangle 10 20 "solid" "blue")

;.
;> (star 12 "solid" "gray")
;.
;> (image-width (circle 100 "solid" "red"))
;200
;> (image-height (rectangle 22 20 "solid" "blue"))



;20 
  
(define(tree-1 x z)
  (place-image(rectangle x z "solid" "brown")
              50 100
          (empty-scene 100 100)))
(define(tree-2 y x z)
  (place-image(circle y "solid" "green")
              50 60
              (tree-1 x z)))
(define (tree k)
  (tree-2 (* k 20) (* k 20) (* k 50)))

(define cat .)


(define (pixel-image x)
  (* (image-width x)(image-height x)))

(define sunny #true)
(define friday #false)
(define(sunny-friday x y)
  (and (or x #false)(or y #false)))

(define (string-troca str i)
  (string-append (substring str 0 i) "_" (substring str i (string-length str))))

;> (sunny-friday sunny friday)
;#false
;> (* (+ (string-length 42) 1) pi)
;string-length: expects a string, given 42

;> (number? e)
;#true
;(boolean? #true)
;#true
;> (rational? pi)
;#true

;> (cond 
;    [(> (image-height cat) (image-width cat)) "Tall"]
;    [(< (image-height cat) (image-width cat)) "Wide"]
;    [(= (image-height cat) (image-width cat)) "Square"])
;"Tall"
(define in "araguari")
(define (oque-in in)
  (if (string? in) (string-length in)
      (if (image? in) (pixel-image in)
          (if (number? in) (if (> in 0) (- in 1) in)
              (if in 10 20)))))

  (define (distancia-ori x y)
  (sqrt(distancia-1 x y)))
(define (cvolume c)
  (* c(* c c)))
(define(string-first x)
  (string-ith x 0))
(define(sunny-fri x y)
  (and (or x #false)(or y #false)))
(define (image-area x)
  (* (image-width x)(image-height x)))
(define (image-classify x)
  (cond 
    [(> (image-height x) (image-width x)) "Tall"]
    [(< (image-height x) (image-width x)) "Wide"]
    [(= (image-height x) (image-width x)) "Square"]))
(define (string-join x y)
  (string-append x "_" y))
(define (string-insert str i)
  (string-append (substring str 0 i) "_" (substring str i (string-length str))))

  (define (ff a)
  (* 10 a))
(ff (+ 1 1))
(+ (ff 1) (ff 1))
; (define (ff a) (* 10 a))
;(ff (+ 1 1))
;(define (ff a) (* 10 a))
;(ff 2)
;(define (ff a) (* 10 a))
;(ff 2)
;(define (ff a) (* 10 a))
;(* 10 2)
;(define (ff a) (* 10 a))
;(* 10 2)
;(define (ff a) (* 10 a))
;20
;(define (ff a) (* 10 a))
;20
;(+ (ff 1) (ff 1))
;(define (ff a) (* 10 a))
;20
;(+ (* 10 1) (ff 1))
;(define (ff a) (* 10 a))
;20
;(+ (* 10 1) (ff 1))
;(define (ff a) (* 10 a))
;20
;(+ 10 (ff 1))
;(define (ff a) (* 10 a))
;20
;(+ 10 (* 10 1))
;(define (ff a) (* 10 a))
;20
;(+ 10 10)
;(define (ff a) (* 10 a))
;20
;20

;(define (distance-to-origin
;         x
;         y)
;  (sqrt
;   (+ (sqr x) (sqr y))))
;(distance-to-origin 3 4)
;(define (distance-to-origin
;         x
;         y)
;  (sqrt
;   (+ (sqr x) (sqr y))))
;(sqrt
; (+ (sqr 3) (sqr 4)))
;(define (distance-to-origin
;         x
;         y)
;  (sqrt
;   (+ (sqr x) (sqr y))))
;(sqrt (+ 9 (sqr 4)))
;(define (distance-to-origin
;         x
;         y)
;  (sqrt
;   (+ (sqr x) (sqr y))))
;(sqrt (+ 9 16))
;(define (distance-to-origin
;         x
;         y)
;  (sqrt
;   (+ (sqr x) (sqr y))))
;(sqrt 25)
;(define (distance-to-origin
;         x
;         y)
;  (sqrt
;   (+ (sqr x) (sqr y))))
;5

;(define (string-first s) (substring s 0 1))
;(string-first "hello world")

;(define (string-first s) (substring s 0 1))
;(substring "hello world" 0 1)

;(define (string-first s) (substring s 0 1))
;"h"

;(define (==> x y)
;  (or (not x) y))
;(==> #true #false)

;(define (==> x y)
;  (or (not x) y))
;(or (not #true) #false)

;(define (==> x y)
;  (or (not x) y))
;(or #false #false)

;(define (==> x y)
;  (or (not x) y))
;#false

; Quando aplicamos o stepper em uma função quadrada obtemos um resultado errado! devemos trocar os sinais "<=" e ">=" por "<" ">" para corrigir

;(define (string-insert s i)
;  (string-append (substring s 0 i) "_" (substring s i)))
;(string-insert "helloworld" 6)

;(define (string-insert s i)
;  (string-append (substring s 0 i) "_" (substring s i)))
;(string-append
; (substring "helloworld" 0 6)
; "_"
; (substring "helloworld" 6))

;(define (string-insert s i)
;  (string-append (substring s 0 i) "_" (substring s i)))
;(string-append "hellow" "_" (substring "helloworld" 6))

;(define (string-insert s i)
;  (string-append (substring s 0 i) "_" (substring s i)))
;(string-append "hellow" "_" "orld")

;(define (string-insert s i)
;  (string-append (substring s 0 i) "_" (substring s i)))
;"hellow_orld"

(define CURRENT-PRICE 5)
(define ALMOST-PI 3.14)
(define NL "\n")
(define MT (empty-scene 100 100))

(define (profit-cinema x)
  (-(-(* x( + 120(* -150(- 5.0 x))))(* 0.04(+ 120(* -150(- 5.0 x))) ))180))
  
;> (profit-cinema 5)
;415.2

(define (profit-cine x)
  (-(* x( + 120(-(* -150(- 5.0 x))1.5)))))

;REVER FUNÇÃO

(define aud-sense
  (/ 15 0.10))

;> aud-sense
;150
