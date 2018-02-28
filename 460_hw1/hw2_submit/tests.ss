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


;;;; Use the following test cases for initial testing.
;;;; Once you are done, remove the provided test cases
;;;;   and add at least 10 test cases of your own for
;;;;   each procedure


(module tests mzscheme
  
  (provide test-list)

  (define test-list
    '(
      ;; s-list->scheme-list  and  scheme-list->s-list
      (s-list-conv1 (equal?? (s-list->scheme-list (scheme-list->s-list '(a b)))
                             (a b)))
      (s-list-conv2 (equal?? (s-list->scheme-list (scheme-list->s-list '(a c)))
                             (a c)))
      (s-list-conv3 (equal?? (s-list->scheme-list (scheme-list->s-list '(b c)))
                             (b c)))
      (s-list-conv4 (equal?? (s-list->scheme-list (scheme-list->s-list '(c)))
                             (c)))
      (s-list-conv5 (equal?? (s-list->scheme-list (scheme-list->s-list '(b)))
                             (b)))
      (s-list-conv6 (equal?? (s-list->scheme-list (scheme-list->s-list '(a)))
                             (a)))
      (s-list-conv7 (equal?? (s-list->scheme-list (scheme-list->s-list '(a b c d)))
                             (a b c d)))
      (s-list-conv8 (equal?? (s-list->scheme-list (scheme-list->s-list '(a b c f)))
                             (a b c f)))
      (s-list-conv9 (equal?? (s-list->scheme-list (scheme-list->s-list '(a b c q)))
                             (a b c q)))
      (s-list-conv10 (equal?? (s-list->scheme-list (scheme-list->s-list '(a b c a)))
                             (a b c a)))
      
      ;; subst
      (subst1 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'd)
                               (scheme-exp->s-exp 'q)
                               (scheme-list->s-list '())))
                       ()))
      (subst2 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'q)
                               (scheme-exp->s-exp 'd)
                               (scheme-list->s-list '(q b c))))
                       (d b c)))
      (subst3 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'q)
                               (scheme-exp->s-exp 'd)
                               (scheme-list->s-list '(q b q c q))))
                       (d b d c d)))
      (subst4 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'w)
                               (scheme-exp->s-exp 'f)
                               (scheme-list->s-list '(w b w c w))))
                       (f b f c f)))
      (subst5 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'w)
                               (scheme-exp->s-exp 't)
                               (scheme-list->s-list '(w b w c w))))
                       (t b t c t)))
      (subst6 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'b)
                               (scheme-exp->s-exp 'w)
                               (scheme-list->s-list '(w b w c w))))
                       (w w w c w)))
      (subst7 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'w)
                               (scheme-exp->s-exp 'f)
                               (scheme-list->s-list '(w))))
                       (f)))
      (subst8 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'w)
                               (scheme-exp->s-exp 'q)
                               (scheme-list->s-list '(w b w c w))))
                       (q b q c q)))
      (subst9 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'w)
                               (scheme-exp->s-exp 'r)
                               (scheme-list->s-list '(w b w c w))))
                       (r b r c r)))
      (subst10 (equal?? (s-list->scheme-list
                        (subst (scheme-exp->s-exp 'e)
                               (scheme-exp->s-exp 'f)
                               (scheme-list->s-list '(e e e e e))))
                       (f f f f f)))
      

      

      ;; lc-exp->scheme-exp  and  scheme-exp->lc-exp
      (exp-conv1 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp 'b)) b))
      (exp-conv2 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp '(x))) (x)))
      (exp-conv3 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp '(x y z))) (x y z)))
      (exp-conv4 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp '(x y z t))) (x y z t)))
      (exp-conv5 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp '(a))) (a)))
      (exp-conv6 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp '(a b f g h))) (a b f g h)))
      (exp-conv7 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp '(y))) (y)))
      (exp-conv8 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp '(y x b))) (y x b)))
      (exp-conv9 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp '(r))) (r)))
      (exp-conv10 (equal?? (lc-exp->scheme-exp (scheme-exp->lc-exp '(q))) (q)))
      
      ;; free-vars
      (free-vars1 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda (a) b))) (b)))
      (free-vars2 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda (a) (a r s)))) (r s)))
      (free-vars3 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda (a f d) d))) ()))
      (free-vars4 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda () b))) (b)))
      (free-vars5 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda () c))) (c)))
      (free-vars6 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda () d))) (d)))
      (free-vars7 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda () e))) (e)))
      (free-vars8 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda () f))) (f)))
      (free-vars9 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda () g))) (g)))
      (free-vars10 (set-equal?? (free-vars (scheme-exp->lc-exp '(lambda (r) r))) ()))

      

      ;; bound-vars
      (bound-vars1 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () b))) ()))
      (bound-vars2 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () c))) ()))
      (bound-vars3 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () d))) ()))
      (bound-vars4 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () e))) ()))
      (bound-vars5 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () f))) ()))
      (bound-vars6 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () g))) ()))
      (bound-vars7 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () h))) ()))
      (bound-vars8 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () i))) ()))
      (bound-vars9 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () j))) ()))
      (bound-vars10 (set-equal?? (bound-vars (scheme-exp->lc-exp '(lambda () k))) ()))




      )
    )
  )
