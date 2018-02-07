;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CMPSC 460-001                        ;;;
;;; Homework 1                           ;;;
;;; Joshua Holden                        ;;;
;;; jah6207@psu.edu                      ;;;
;;;                                      ;;;
;;; Note:                                ;;;
;;;   You're a swell person              ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(module hw1 (lib "eopl.ss" "eopl")

  (provide
   duple
   invert
   down
   up
   swapper
   count-occurrences
   product
   filter-in
   list-index
   every?
   exists?
   flatten
   merge
   rotate
   ribassoc
   )


  ;;;; Define each of your procedures
  ;;;;   the corresponding comments
  
  
  ;; (duple n x)
  ;; (invert lst)
  ;; (down lst)
  ;; (up lst)
  ;; (swapper s1 s2 slst)
  ;; (count-occurrences s slst)
  ;; (product sos1 sos2)
  ;; (filter-in pred lst)
  ;; (list-index pred lst)
  ;; (every? pred lst)
  ;; (exists? pred lst)
  ;; (flatten slst)
  ;; (merge lon1 lon2)
  ;; (ribassoc s los v fail-value)  
  ;; (rotate los)


  
; duple: symbol, S exp -> list
(define duple
  (lambda (a b)
    (if (eq? a 0) '()
        (cons b (duple (- a 1) b)))))
  
; exists?: procedure, list -> bool
(define exists?
  (lambda (pred lst)
    (cond
      ((null? lst) #f)
      ((pred (car lst)) #t)
      ;if it is not the first elem keep trying
      ((not (pred (car lst))) (exists? pred (cdr lst)))
      (else #f))))
  
; every?: procedure, list -> bool
(define every?
  (lambda (pred lst)
    (cond
      ((null? lst) #t)
      ;if not the current elem keep going
      ((pred (car lst)) (every? pred (cdr lst)))
      (else #f))))

; down: lst -> lst
(define down
  (lambda (lst)
    (cond
        ((null? lst) '())
        ; you will take the first elem and cons it to a list, then cons that to the recursive call
        (else (cons (cons (car lst) '()) (down (cdr lst)))))))

; filter-in: procedure, lst -> lst
(define filter-in
  (lambda (pred lst)
    (cond
      ((null? lst) '())
      ;if it a lst then skip over it
      ((not (atom? (car lst))) (filter-in pred (cdr lst)))
      ;if the car matches the predicate, add it to the recursive call lst
      ((pred (car lst)) (cons (car lst) (filter-in pred (cdr lst))))
      (else (filter-in pred (cdr lst))))))

; merge: list of numbers, list of numbers -> list
(define merge
  (lambda (lon1 lon2)
    (cond
      ;if one of the lists is empty just take the whole other list and add it to the final list
      ((and (null? lon1) (not (null? lon2)))  (cons (car lon2) (merge lon1 (cdr lon2))))
      ((and (null? lon2) (not (null? lon1)))  (cons (car lon1) (merge (cdr lon1) lon2)))
      ((null? lon1) '())
      ((null? lon2) '())
      ;lon1 > lon2, then take the smaller elem and add it to the final list
      ((positive? (- (car lon1) (car lon2))) (cons (car lon2) (merge lon1 (cdr lon2))))
      ;lon2 > lon1
      ((positive? (- (car lon2) (car lon1))) (cons (car lon1) (merge (cdr lon1) lon2)))
      ;if they are even with eachother then just take the first elem and add to list
      (else (cons (car lon1) (merge (cdr lon1) lon2))))))
  
; list-index: procedure, list -> index(number)
(define list-index
  (lambda (pred lst)
    (cond
      ((null? lst) #f)
      ;if the car is a list,    assign the recursive call to x to test to see if it is a bool or a number
      ((not (atom? (car lst))) (let ([x (list-index pred (cdr lst))])
                                 ;if it is a number then add 1 if not return false
                               (if (number? x) (+ 1 x)
                                   #f)))
      ((pred (car lst)) 0)
      ((not (pred (car lst))) (let ([x (list-index pred (cdr lst))])
                               (if (number? x) (+ 1 x)
                                   #f))))))

;flatten: slst -> lst
(define flatten
  (lambda (slst)
    (cond
      ((null? slst) '())
      ;if the car is a symbol then make it a list and append it to the final recursive call
      ((atom? (car slst)) (append (list (car slst)) (flatten (cdr slst))))
      ;if it is an slst then append the recursive call on itself to the recursive call of the rest of the slst
      ((not (atom? (car slst))) (append (flatten (car slst)) (flatten (cdr slst))  ))
      )))

;count-occurences: symbol, slist-> number
(define count-occurrences
  (lambda (s slst)
    (let ([lst (flatten slst)])
      ;make it easier to handle by just flattening it every time
      (cond
        ((null? lst) 0)
        ;because it is flattened you can just add as you go through recursively
        ((eq? s (car lst)) (+ 1 (count-occurrences s (cdr lst))))
        (else (count-occurrences s (cdr lst)))))))

;invert: list -> list
(define invert
  (lambda (lst)
    (cond
      ((null? lst)'())
      ;just reverse the list and cons the list to the recursive list
      ((not (atom? (car lst))) (cons (reverse (car lst)) (invert (cdr lst)))))))

;up: list -> list
(define up
  (lambda (lst)
    (cond
      ((null? lst) '())
      ;if it is a list append it to its recursive call
      ((list? (car lst)) (append (car lst) (up (cdr lst))))
      (else (cons (car lst) (up (cdr lst)))))))

;swapper: symbol, symbol, list -> list
(define swapper
  (lambda (s1 s2 lst)
    (cond
      ((null? lst) '())
      ((eq? (car lst) s1) (cons s2 (swapper s1 s2 (cdr lst))))
      ((eq? (car lst) s2) (cons s1 (swapper s1 s2 (cdr lst))))
      ;if it is a list then you have to do the recursion on it and cons that to the rest of the list
      ((not (atom? (car lst))) (cons (swapper s1 s2 (car lst)) (swapper s1 s2 (cdr lst))))
      (else (cons (car lst) (swapper s1 s2 (cdr lst)))))))

;rotate: list -> list
(define rotate
  (lambda (lst)
    (cond
      ((null? lst) '())
      ;check helpers
      (else (cons (last lst) (begin lst))))))
;last: lst -> symbol
(define last
  (lambda (lst)
    (cond
      ((null? (cdr lst)) (car lst))
      (else (last (cdr lst))))))
;begin: list -> list
(define begin
  (lambda (lst)
    (cond
      ((null? (cdr lst)) '()); finds the list mi
      (else (cons (car lst) (begin (cdr lst)))))))

; ribassoc: symbol, list(size n), vector(size n), symbol -> symbol
(define ribassoc
  (lambda (s los v fail-value)
    (cond
      ((null? los) fail-value)
      ;if the list contains the symbol then return the vector location at index
      ((contain? s los) (vector-ref v (index s los)))
      (else fail-value))))
;index: symbol, list -> number
(define index
  (lambda (s lst)
    (cond
      ((null? lst) 0)
      ((not (eq? s (car lst))) (+ 1 (index s (cdr lst))))
      (else 0))))
;index: symbol, list -> bool
(define contain?
  (lambda (s lst)
    (cond
      ((null? lst) #f)
      ((eq? s (car lst)) #t)
      (else (contain? s (cdr lst))))))
;product: list, list -> list
(define product
  (lambda (lst los)
    (cond
      ((null? lst) '())
      ((null? los) '())
      ;make a list and then append the products from every symbol in list to it
      (else (append (cart-one (car lst) los) (product (cdr lst) los))))))
;cart-prod: symbol, symbol -> list
(define cart-prod
  (lambda (s1 s2)
    (cons s1 (cons s2 '()))))
;cart-one: symbol, list -> list
(define cart-one
  (lambda (s1 lst)
    (cond
      ((null? lst) '())
      ;go through the list and make a cartesian product of every item in list with the symbol
      (else (cons  (cart-prod s1 (car lst)) (cart-one s1 (cdr lst)))))))
;atom?: symbol -> bool
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))
  
             
  

  ;;;; DO NOT REMOVE THE FOLLOWING PARENTHESIS
)
