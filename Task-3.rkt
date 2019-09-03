
; EXERCICIO 33

; Um BUG na maneira como a data era escrita nos antigos programas que ocorreu na virada do ano 2000

; EXERCICIO 34

; We use numbers to represent centimeters.

(define (f a-string) 0)

(define (g n) "a")

(define (h num str img) (empty-scene 100 100))

; Number String Image -> Image 
; adds s to img,
; y pixels from the top and 10 from the left 
(define (add-image y s img)
  (empty-scene 100 100))

; Number -> Number
; computes the area of a square with side len 
; given: 2, expect: 4
; given: 7, expect: 49
(define (area-of-square len)
  (sqr len))

;> (area-of-square 2)
;4

;> (area-of-square 7)
;49

(define(string-first x)
  (string-ith x 0))

; EXERCICIO 35

(define(string-place y)
  (-(string-length y)1))
(define(string-last x)
  (string-ith x (string-place x)))

; EXERCICIO 36

(define(image-area x)
  (* (image-height x)(image-width x)))

; EXERCICIO 37

(define (string-rest str)
  (string-append (substring str 0 0) (substring str (+ 0 1))))

; EXERCICIO 38

(define (string-remove-last str)
  (string-append (substring str 0 (string-place str)) (substring str (+ (string-place str) 1))))

; Number -> Number 
; converts Fahrenheit temperatures to Celsius
; given 32, expect 0
; given 212, expect 100
; given -40, expect -40
(define (f2c f)
  (* 5/9 (- f 32)))
(check-expect (f2c -40) -40)
(check-expect (f2c 32) 0)
(check-expect (f2c 212) 100)

;All 3 tests passed!

; EXERCICIO 39
(define WIDTH-OF-WORLD 400)
(define HEIGHT-OF-WORLD 40)
(define raio-roda 5)
(define distancia-eixo(* raio-roda 5))
(define carro-1 (place-image(circle raio-roda "solid" "black")
                (* 2 raio-roda) (* 3 raio-roda)
                  (place-image(circle raio-roda "solid" "black")
                (* 7 raio-roda) (* 3 raio-roda)
                (place-image(rectangle (* 7 raio-roda)(* 3 raio-roda)  "solid" "red")
                            (* 4.5 raio-roda) (* 1.5 raio-roda)
                (empty-scene (* 9 raio-roda)(* 4 raio-roda))))))
(define y-carro-1 (- HEIGHT-OF-WORLD (/ (image-height carro-1) 2)))
(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))
(define BACKGROUND (place-image
                    tree
                    200 (- HEIGHT-OF-WORLD (/ (image-height tree) 2))
                    (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD)))


; WorldState -> WorldState  
; move o carro em 3 pixels para cada marca de relógio 
; exemplos: 
;   given: 20, expect 23
;   given: 78, expect 81 
( define ( tock ws )
  ( + ws 3 ) )

(check-expect ( tock 20 ) 23)
(check-expect ( tock 78 ) 81)

; EXERCICIO 40

  ; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
(define (render ws)
   (place-image carro-1 ws y-carro-1 BACKGROUND))

; EXERCICIO 41

(define (end? ws)
  (>= ws (+ WIDTH-OF-WORLD (/ (image-width carro-1) 2))))
   (define (main ws)
   (big-bang ws
             (on-tick tock)
             (to-draw render)
             (stop-when end?)))

; EXERCICIO 42
; Modificar programa (margem direira do carro)

(define centro-carro-1 (/ (image-width carro-1) 2))
;(define (render ws)
;   (place-image carro-1 (-ws centro-carro-1) y-carro-1 BACKGROUND))


;EXERCICIO 43



;EXERCICIO 44

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

; (hyper 21 10 20 "enter")
;21
;(hyper 42 10 20 "move")
;42

(define cat1 .)
(define cat2 .)

; EXERCICIO 45
(define y-cat-1 (- HEIGHT-OF-WORLD (/ (image-height cat1) 8)))
(define alturac (image-height cat1))
(define BACKGROUNDc (empty-scene WIDTH-OF-WORLD alturac))
(define (renderc ws)
   (place-image cat1 ws y-cat-1 BACKGROUNDc))

  (define (mainc ws)
   (big-bang ws
             (on-tick tock)
             (to-draw renderc)
             (stop-when end?)
             ))
; EXERCICIO 46
; x -> 
(define (rendercat ws)
  (if (= (modulo ws 2) 0)
      (place-image cat1 ws y-cat-1 BACKGROUNDc)
      (place-image cat2 ws y-cat-1 BACKGROUNDc)))
  (define (maincat ws)
   (big-bang ws
             (on-tick tock)
             (to-draw rendercat)
             (stop-when end?)
             ))

; EXERCICIO 47

;(define ww 100)
;(define (tick ww)
;  (- ww 0.1))
;(define (tecla w a-key)
;  (cond
;    [(key=? a-key "down")  (+ ww 20)]
;    [(key=? a-key "up") (+ ww 33)]
;    [else ww]))
;(define (happy ww)
;  (big-bang ww
;    (on-tick tick)
;    (to-draw )
;    (on-key tecla)
;    (stop-when 0?)))

; EXERCICIO 48
;STEPPER
;EXERCICIO 49
;STEPPER

; EXERCICIO 50

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; EXERCICIO 51

(define(change str)
  (cond
   [(number? 1) "green"]
    [(number? 2) "yellow"]
    [(number? 3) "red"]))

(define (circle-color str)(circle 10 "solid" (change str)))
(define(rendercolor str)
   (place-image (circle-color str) str y-carro-1 BACKGROUND))


(define (mainSTR ws)
   (big-bang ws
             (on-tick (change ws))
             (to-draw rendercolor)
             (stop-when end?)))

; EXERCICIO 52

; close-> height / 3
; height-> 100
; [3,5] => 3,4,5
; (3,5] => 4,5
; [3,5) => 3,4
; (3,5) => 4

; EXERCICIO 53
(define HEIGHT 300) 
(define WIDTH  100)
(define XPOS    10)
(define YDELTA   3)
(define BACKG         (empty-scene WIDTH HEIGHT))
(define ROCKET        (rectangle 5 30 "solid" "red"))
(define ROCKET-CENTER (/ (image-height ROCKET) 2))
(define GROUND        (- HEIGHT ROCKET-CENTER))

;(define (show x)
 ; (cond
 ;   [(string? x) (position-rocket 0)]                 
 ;   [(< x 0)                                           
 ;    (place-image (text (number->string x) 20 "red")
 ;                         XPOS (* 3/4 WIDTH)
 ;                         (position-rocket 0))]         
 ;   [else (position-rocket x)]))

;(define (position-rocket h)
 ; (place-image ROCKET XPOS (- GROUND h) BACKG))

;(define (launch x ke)  
 ; (cond
 ;   [(string? x)                  
 ;    (if (string=? " " ke) -3 x)] 
 ;   [else x]))

;(define (fly x)  
 ; (cond
 ; [(string? x) x]             
 ;   [(< x 0)    (+ x 1)]        
 ;  [(>= x 0)   (+ x YDELTA)]))

;(define (done ws)
;  (cond
;    [(string? ws)  #false]  
;    [(= ws HEIGHT) #true]    
;    [else          #false]))

;(define (mainr s)
;  (big-bang s
;            (to-draw   show)    
;            (on-key    launch)  
;            (on-tick   fly 0.05) 
                                
;            (stop-when done)))



;EXERCICIO 54
;; (string=? "resting" x) É INAPROPRIADO POIS É UM ESTADO QUE A STRING NÃO PODE SE ENCONTRAR

; EXERCICIO 55 ------- *

;(check-expect (render-rocket 10)
 ;             (place-image ROCKET 10 (- 10 CENTER) BACKG))

;(define (render-rocket x)
 ; (place-image ROCKET 10 (- x CENTER) BACKG))

;(define (show-2 x)
 ; (cond
 ;   [(string? x)
 ;    (render-rocket HEIGHT)]
 ;   [(<= -3 x -1)
 ;    (place-image (text (number->string x) 20 "red")
 ;                 10 (* 3/4 WIDTH)
 ;                 (render-rocket HEIGHT))]
 ;   [(>= x 0)
 ;    (render-rocket x)]))

; EXERCICIO 58

(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) 0]
    [(and (>= p 1000) (< p 10000)) (* 0.05 p)]
    [(>= p 10000) (* 0.08 p)]))

(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 12017) (* 0.08 12017))


(define imp-baixo 0.00)
(define imp-medio 0.05)
(define imp-alto 0.08)

(define inicio-baixo 0)
(define inicio-medio 1000)
(define inicio-alto 10000)

(define (sales-tax-2 p)
  (cond
    [(and (<= inicio-baixo p) (< p inicio-medio)) imp-baixo]
    [(and (>= p inicio-medio) (< p inicio-alto)) (* imp-medio p)]
    [(>= p inicio-alto) (* imp-alto p)]))

(check-expect (sales-tax-2 537) 0)
(check-expect (sales-tax-2 1000) (* 0.05 1000))
(check-expect (sales-tax-2 12017) (* 0.08 12017))

; EXERCICIO 59


(define (tl-next cs)
   (cond
    [(string=? "red" cs) "green"]
    [(string=? "green" cs) "yellow"]
    [(string=? "yellow" cs) "red"]))

(define (tl-render current-state)
  (place-image (circle 10 "solid" (tl-next current-state))
               15 15
  (empty-scene 90 30)))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))

; EXERCICIO 60

(define (tl-nextN cs)
   (cond
    [(= 1 cs) 2]
    [(= 2  cs) 3]
    [(= 3 cs) 1]))

(define (tl-next-numeric cs) (modulo (+ cs 1) 3))
(define x 10)
(define SPACE (/ x 2))
 (define (tl-renderN cs)
 (place-image (circle 10 "solid" (conv (tl-nextN cs)))
               15 15
  (empty-scene 90 30)))

(define (conv tl)
  (cond [(equal? tl 1) "red"]
        [(equal? tl 2) "green"]
        [(equal? tl 3) "yellow"]))

(define (traffic-light-simulationn cs)
  (big-bang cs
    [to-draw tl-renderN]
    [on-tick tl-nextN 1]))

; EXERCICIO 61

(define RED "red")
(define GREEN "green")
(define YELLOW "yellow")

(define (tl-next-numeric2 cs)
  (modulo (+ cs 1) 3))

	
(define(tl-next-symbolic cs)
  (cond
    [(equal? cs RED) GREEN]
    [(equal? cs GREEN) YELLOW]
    [(equal? cs YELLOW) RED]))

;> (tl-next-symbolic GREEN)
;"yellow"
;> (tl-next-numeric2 GREEN)
;+: expects a number as 1st argument, given "green"

; EXERCICIO 62

(define LOCKED "locked")
(define CLOSED "closed")
(define OPEN "open")

(define (door-state state)
  (cond
    [(string=? LOCKED state) LOCKED]
    [(string=? CLOSED state) CLOSED]
    [(string=? OPEN state) CLOSED]))

(define (door-ac str y)
  (cond
    [(and (string=? LOCKED str) (string=? "u" y))CLOSED]
    [(and (string=? CLOSED str) (string=? "l" y))LOCKED]
    [(and (string=? CLOSED str) (string=? " " y))OPEN]
    [else str]))

(define (render-state str)
  (text str 30 "black"))

(define (door-simulation ws)
  (big-bang ws
          [on-tick door-state 3]  
          [on-key door-ac]
          [to-draw render-state]))

;> (door-simulation "closed")
;"closed"

;EXERCICIO 63

(define(distance-to-0 ap)
  (sqrt
    (+ (sqr (posn-x ap))
       (sqr (posn-y ap)))))

;> (distance-to-0 (make-posn 3 4))
;5
;> (distance-to-0 (make-posn 6 (* 2 4)))
;10
;> (+ (distance-to-0 (make-posn 12 5)) 10)
;23

;EXERCICIO 64

(define(manhattan-distance ap)
  (+ (posn-x ap)(posn-y ap)))

; Não interessa a estrategia que seguir pois o resultado será sempre o mesmo

;> (manhattan-distance (make-posn 3 4))
;7

; EXERCICIO 65

(define-struct movie [title producer year])
;make-movie
;titulo-filme, produtor-filme, ano-filme
;entrada -> strings

(define-struct person [name hair eyes phone])
;make-person
;nome-pessoa, cor-cabelo , cor-olhos , telephone-pessoa
;entrada -> strings

(define-struct pet [name number])
;make-pet
;nome-pet , numero-pet
;entrada -> strings

(define-struct CD [artist title price])
;make-cd
;produtor-cd ; titulo-cd , preco-cd
;entrada -> strings

(define-struct sweater [material size producer])
;make-sweater
;material-sweater , tamanho-sweater , produtor-sweater
;entrada -> strings

;EXERCICIO 66

;(define-struct movie [title producer year])
;MOVIE -> string
;title -> string
;producer -> string
;year -> number
;(make-movie "A lista de schindler" "Steven Spielberg" 1993)

;(define-struct person [name hair eyes phone])
;name -> string
;hair -> string
;eyes -> string
;phone -> number

;(define-struct pet [name number])
;name -> string
;number -> number

;(define-struct CD [artist title price])
;artist-> string
;title -> string
;price -> number

;(define-struct sweater [material size producer])
;material -> string
;size -> number
;producer -> string

; EXERCICIO 67
(define-struct ball [location velocity])

(define SPEED 3)
(define-struct balld [location direction])
(make-balld 10 "up")

;(make-balld 100 "down")
;(make-balld (+ 20 SPEED) "up")
;(make-balld 0 "down")

(define-struct vel [deltax deltay])

(define ball1
  (make-ball (make-posn 30 40) (make-vel -10 5)))

; exercicio 68

(define-struct ballf [x y deltax deltay])
(define-struct centry [name home office cell])
 
(define-struct phone [area number])

;(make-centry "Shriram Fisler"
;             (make-phone 207 "363-2421")
;             (make-phone 101 "776-1099")
;             (make-phone 208 "112-9981"))
;(make-centry
; "Shriram Fisler"
; (make-phone 207 "363-2421")
; (make-phone 101 "776-1099")
; (make-phone 208 "112-9981"))

(make-centry "Shriram Fisler"
             (make-phone 207 "363-2421")
             (make-phone 101 "776-1099")
             (make-phone 208 "112-9981"))
