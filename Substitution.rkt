#lang slideshow




(define (soma lista)
    (define (soma-aux lista ac)
      (if (empty? lista)
          ac
          (soma-aux(cdr lista) (+ (car lista) ac ))))
    (soma-aux lista 0))


(define (substitui a b lista)
  (define (sub-aux lista listab)
    (if (empty? lista)
        (inverte lista listab)
        (if (equal? a (car lista))
        (sub-aux (cdr lista) (cons b listab))
        (sub-aux (cdr lista) (cons (car lista) listab)))))
  (sub-aux lista empty))
  (define (inverte lista listab)
    (define (list-aux lista listab)
      (if (empty? listab)
          lista
          (list-aux (cons (car listab) lista) (cdr listab))))
    (list-aux lista listab))

(define a '(1 2 3 4 5 6 7 8 9 10))

  


 
