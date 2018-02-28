;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CMPSC 460-001                        ;;;
;;; Homework 2                           ;;;
;;; Your Name                            ;;;
;;; Your AccessID                        ;;;
;;;                                      ;;;
;;; Note:                                ;;;
;;;   Write whatever you want the grader ;;;
;;;   to know before grading.            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(module hw2 (lib "eopl.ss" "eopl")

  (provide
   s-list->scheme-list
   scheme-list->s-list
   s-exp->scheme-exp
   scheme-exp->s-exp
   subst
   
   scheme-exp->lc-exp
   lc-exp->scheme-exp
   
   free-vars
   
   bound-vars

  )


  ;; S-List
  ;;
  ;; <s-list> ::= ( {s-exp}* )  <== () | ( <s-exp> . <s-list> )
  ;;              [[ empty-s-list ]]  |  [[ non-empty-s-list (s-exp s-list) ]]
  ;; <s-exp>  ::= <symbol> | <s-list>
  ;;              [[ symbol-s-exp (sym) ]]  |  [[ s-list-s-exp (slist) ]]

  ;; Define the necessary data types and procedures for S-List
  ;; conforming to both concrete as well as abstract syntax above

  




  ;; Lc-exp
  ;;
  ;; Lc-exp ::= Identifier
  ;;            [[ var-exp (var) ]]
  ;;        ::= (lambda ( {Identifier}* ) Lc-exp)
  ;;            [[ lambda-exp (bound-vars body) ]]
  ;;        ::= ( Lc-exp {Lc-exp}* )
  ;;            [[ app-exp (rator rands) ]]

  (define identifier? symbol?)

  ;; Write the abstract syntax for Lc-exp whose concrete syntax is give above
  ;; (See S-List as an example)
  ;;
  ;; Then, define the necessary data types and procedures for Lc-exp
  ;; conforming to both concrete syntax above and your  abstract syntax.

(define-datatype s-list s-list?
  (empty-s-list)
  (non-empty-s-list (first s-exp?)
                    (rest s-list?)))

(define-datatype s-exp s-exp?
  (symbol-s-exp (sym symbol?))
  (s-list-s-exp (slist s-list?)))

(define scheme-list->s-list
  (lambda (lst)
    (cond
      ((null? lst) (empty-s-list))
      (else
       (non-empty-s-list (scheme-exp->s-exp (car lst)) ;to follow data encapsulation
                         (scheme-list->s-list (cdr lst)))))))

(define s-list->scheme-list
  (lambda (slst)
    (cases s-list slst
      (empty-s-list () '())
      (non-empty-s-list (first rest)
                        (cons (s-exp->scheme-exp first)
                              (s-list->scheme-list rest))))))
  
(define scheme-exp->s-exp
  (lambda (exp)
    (cond
      ;((null? exp) empty-s-list)
      ((symbol? exp) (symbol-s-exp exp))
      (else (s-list-s-exp  (scheme-list->s-list exp))))))

(define s-exp->scheme-exp
  (lambda (sExp)
    (cases s-exp sExp
      (symbol-s-exp (sym) sym)
      (s-list-s-exp (slist) (s-list->scheme-list slist)))))

(define subst
  (lambda (s-e1 s-e2 s-List)
    (cases s-list s-List
      (empty-s-list () (empty-s-list))
      (non-empty-s-list (first rest)
                        (cond
                          ((equal? first s-e1) (non-empty-s-list s-e2
                                                  (subst s-e1 s-e2 rest)))
                          (else (non-empty-s-list first (subst s-e1 s-e2 rest))))))))

      
#|
(define subst
  (lambda (s-exp1 s-exp2 s-list)
    (scheme-list->s-list
     (swapper (s-exp->scheme-exp s-exp1)
              (s-exp->scheme-exp s-exp2)
              (s-list->scheme-list s-list)))))
|#
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

;atom?: symbol -> bool
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))


;this is for a list of identifiers
(define var-list?
  (lambda (lst)
    (cond
      ((null? lst) #t)
      ((identifier? (car lst)) (var-list? (cdr lst)))
      (else #f))))
;this is for a list of lc-exp
(define list-of-lc?
  (lambda (lst)
    (cond
      ((null? lst) #t)
      ((lc-exp? (car lst)) (list-of-lc? (cdr lst)))
      (else #f))))

(define-datatype lc-exp lc-exp?
  (var-exp (var identifier?))              ;only need to store argument and body lol
  (lambda-exp (bound-var var-list?)
              (body lc-exp?))
  (app-exp (rator lc-exp?)
           (rand list-of-lc?)))

(define lc-exp->scheme-exp
  (lambda (lc-ex)
    (cases lc-exp lc-ex
      (var-exp (var) (cond
                       ((null? var) '())
                       (else var)))
      (lambda-exp (bound-var body)
                  (cons (car '(lambda)) (cons bound-var (cons (lc-exp->scheme-exp body) '()))))
      (app-exp (rator rand)
               (cons  (lc-exp->scheme-exp rator) (map-back rand))  ))))

(define scheme-exp->lc-exp
  (lambda (scheme)
    (cond
      ((symbol? scheme) (var-exp scheme))
      ((eq? (car scheme) (car '(lambda)))
       (lambda-exp (cadr scheme) (scheme-exp->lc-exp (caddr scheme))))
      ;((null? (cdr scheme)) (scheme-exp->lc-exp (car scheme)))
      ;((symbol? (car scheme)) (var-exp scheme))
      (else
       (app-exp (scheme-exp->lc-exp (car scheme)) (map-lc (cdr scheme)))))))
;maps the scheme->lc for the list of lc in app exp
(define map-lc
  (lambda (list)
    (cond
      ((null? list) '())
      (else (cons (scheme-exp->lc-exp (car list)) (map-lc (cdr list)))))))
;maps back from the lc-exp to make scheme expressions
(define map-back
  (lambda (list)
    (cond
      ((null? list) '())
      (else (cons (lc-exp->scheme-exp (car list)) (map-back (cdr list)))))))


(define flatten
  (lambda (slst)
    (cond
      ((null? slst) '())
      ((atom? (car slst)) (append (list (car slst)) (flatten (cdr slst))))
      ((not (atom? (car slst))) (append (flatten (car slst)) (flatten (cdr slst))  ))
      )))

;returns true if a symbol is in a list
(define exists?
  (lambda (sym lst)
    (cond
      ((null? lst) #f)
      ((eq? sym (car lst)) #t)
      (else (exists? sym (cdr lst))))))

(define free-vars
  (lambda (exp)
    (cases lc-exp exp
      (var-exp (sym) sym)
      (lambda-exp (bound-list body) (list-check (make-bound-list bound-list body)
                                                (make-body-vars body)))
      (app-exp    (lcExp listLcExp) (append (free-vars lcExp)
                                            (map-free-var listLcExp)))
      )))
;maps the free-vars function to the list of lc-exp 
(define map-free-var
  (lambda (lst)
    (cond
      ((null? lst) '())
      (else (append (free-vars (car lst)) (map-free-var (cdr lst)))))))
;checks what values are in the lists against each other
(define list-check
  (lambda (bound body)
    (cond
      ((null? body) '())
      ((exists? (car body) bound) (list-check bound (cdr body)))
      (else (cons (car body) (list-check bound (cdr body)))))))
;make a list of all the bound vars
(define make-bound-list
  (lambda (bound-list body)
    (cases lc-exp body
      (var-exp (sym) (append bound-list '()))
      (lambda-exp (b-list lBody) (append bound-list (make-bound-list b-list lBody)))  
      (app-exp (rator rand) (append (make-bound-list bound-list rator)
                                    (map-make-bound rand)))
      )))
;map the make-bound-list function over a list of lc-exp
(define map-make-bound
  (lambda (lst)
    (cond
      ((null? lst) '())
      (else (append (make-bound-list '() (car lst))
                    (map-make-bound (cdr lst)))))))
;map the make-body-vars to a list of lc-exp
(define map-make-body
  (lambda (lst)
    (cond
      ((null? lst) '())
      (else (append (make-body-vars (car lst)) (map-make-body (cdr lst)))))))
;makes a list of all the body variables
(define make-body-vars
  (lambda (body)
    (cases lc-exp body
      (var-exp (sym) (cons sym '()))
      (lambda-exp (bound-list body) (make-body-vars body))
      (app-exp (lcExp lstLc) (append (make-body-vars lcExp)
                                     (map-make-body lstLc))))))

(define bound-vars
  (lambda (exp)
    (cases lc-exp exp
      (var-exp (sym) sym)
      (lambda-exp (bound-list body) (list-check2 (make-bound-list bound-list body)
                                                (make-body-vars body)))
      (app-exp    (lcExp listLcExp) (append (free-vars lcExp)
                                            (map-free-var listLcExp)))
      )))
;checks the list to make sure the values are not in the bound variables list
(define list-check2
  (lambda (bound body)
    (cond
      ((null? body) '())
      ((not (exists? (car body) bound)) (list-check2 bound (cdr body)))
      (else (cons (car body) (list-check2 bound (cdr body)))))))

  
  ;;;; DO NOT REMOVE THE FOLLOWING PARENTHESIS
)
