;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CMPSC 460-001                        ;;;
;;; Homework 1                           ;;;
;;; Joshua Holden                        ;;;
;;; jah6207@psu.edu                      ;;;
;;;                                      ;;;
;;; Note:                                ;;;
;;;   Write whatever you want the grader ;;;
;;;   to know before grading.            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; Use the following test cases for initial testing.
;;;; Once you are done, remove the provided test cases
;;;;   and add at least 5 test cases of your own for
;;;;   each procedure


(module tests mzscheme
  
  (provide test-list)

  (define test-list
    '(

      ;; (duple n x)
      (duple1 (equal?? (duple 3 3) (3 3 3)))
      (duple2 (equal?? (duple 2 '(ha ha)) ((ha ha) (ha ha))))
      (duple3 (equal?? (duple 0 '(3)) ()))
      (duple4 (equal?? (duple 2 '(s)) ((s) (s))))
      (duple5 (equal?? (duple 1 '(3)) ((3))))

      ;; (invert lst)
      (invert1 (equal?? (invert '((a 1) (a 2) (1 b))) ((1 a) (2 a) (b 1))))
      (invert2 (equal?? (invert '((2 3))) ((3 2))))
      (invert3 (equal?? (invert '((a 1) (a 2) (1 b) (b 3))) ((1 a) (2 a) (b 1) (3 b))))
      (invert4 (equal?? (invert '((a b))) ((b a))))
      (invert5 (equal?? (invert '((z y) (a b))) ((y z) (b a))))

      ;; (down lst)
      (down1 (equal?? (down '(1 2)) ((1) (2))))
      (down2 (equal?? (down '((a) (fine))) (((a)) ((fine)))))
      (down3 (equal?? (down '(a (more (complicated)))) ((a) ((more (complicated))))))
      (down4 (equal?? (down '(d (g))) ((d) ((g)))))
      (down5 (equal?? (down '(1)) ((1))))

      ;; (up list)
      (up1 (equal?? (up '((1 2) (3 4))) (1 2 3 4)))
      (up2 (equal?? (up '((x (y) z))) (x (y) z)))
      (up3 (equal?? (up '(a (b) ((c)))) (a b (c))))
      (up4 (equal?? (up '((g))) (g)))
      (up5 (equal?? (up '(d (g))) (d g)))

      ;; (swapper s1 s2 slist)
      (swapper1 (equal?? (swapper 'a 'd '(a b d)) (d b a)))
      (swapper2 (equal?? (swapper 'a 'd '(a () c d)) (d () c a)))
      (swapper3 (equal?? (swapper 'x 'y '(() y (z (x)))) (() x (z (y)))))
      (swapper4 (equal?? (swapper 'x 'y '((s) y (z (x)))) ((s) x (z (y)))))
      (swapper5 (equal?? (swapper 'x 'y '((y) y (z (x)))) ((x) x (z (y)))))

      ;; (count-occurrences s slst)
      (count-occurences1 (equal?? (count-occurrences 'f '((f x) y (((x z) x)))) 1))
      (count-occurences2 (equal?? (count-occurrences 'x '((f x x) y (((x z) () x)))) 4))
      (count-occurences3 (equal?? (count-occurrences 'w '((f x w) y (((x z) x)))) 1))
      (count-occurences4 (equal?? (count-occurrences 'w '((f x) y (((w x z) x)))) 1))
      (count-occurences5 (equal?? (count-occurrences 'y '((f x) y (((x z) x)))) 1))

      ;; (product sos1 sos2)
      (product1 (set-equal?? (product '(a b) '(1 2)) ((a 1) (a 2) (b 1) (b 2))))
      (product2 (set-equal?? (product '() '(1)) ()))
      (product3 (set-equal?? (product '(a b) '()) ()))
      (product4 (set-equal?? (product '(a b c) '(1)) ((a 1) (b 1) (c 1))))
      (product5 (set-equal?? (product '(a c) '(1 2)) ((c 2) (a 1) (a 2) (c 1))))

      ;; (filter-in pred lst)
      (filter-in1 (equal?? (filter-in number? '(a (1 4 3) b 7)) (7)))
      (filter-in2 (equal?? (filter-in symbol? '(a (b here c) 17 foo)) (a foo)))
      (filter-in3 (equal?? (filter-in symbol? '(a (b c) 17 (foo))) (a)))
      (filter-in4 (equal?? (filter-in symbol? '(a (b c) 17)) (a)))
      (filter-in5 (equal?? (filter-in symbol? '(a (b c foo))) (a)))

      ;; (list-index pred lst)
      (list-index1 (equal?? (list-index number? '(a (1 3) b 7)) 3))
      (list-index2 (equal?? (list-index symbol? '((b c) 17 foo)) 2))
      (list-index3 (equal?? (list-index symbol? '(1 2 (a b) 3 a)) 4))
      (list-index4 (equal?? (list-index symbol? '(1 2 3)) #f))
      (list-index5 (equal?? (list-index symbol? '(1 2 (a) 3)) #f))

      ;; (every? pred lst)
      (every?1 (equal?? (every? number? '(a b c 3 e)) #f))
      (every?2 (equal?? (every? number? '(1 2 3 5 4)) #t))
      (every?3 (equal?? (every? number? '(1 2 3 5)) #t))
      (every?4 (equal?? (every? number? '(1 2 3 a 4)) #f))
      (every?5 (equal?? (every? number? '(a v b d s)) #f))

      ;; (exist? pred lst)
      (exists?1 (equal?? (exists? number? '(a b c 3 e)) #t))
      (exists?2 (equal?? (exists? number? '(a 2 c d e)) #t))
      (exists?3 (equal?? (exists? symbol? '(a b c d e)) #t))
      (exists?4 (equal?? (exists? number? '(1 2 3 4 5)) #t))
      (exists?5 (equal?? (exists? symbol? '(2 d 2)) #true))

      ;; (flatten slst)
      (flatten1 (equal?? (flatten '(a b (c))) (a b c)))
      (flatten2 (equal?? (flatten '((a) () ((b) ()) () (c))) (a b c)))
      (flatten3 (equal?? (flatten '((a b) c (((d)) (e)))) (a b c d e)))
      (flatten4 (equal?? (flatten '(b (() (c)))) (b c)))
      (flatten5 (equal?? (flatten '(a b ((s) (c)))) (a b s c)))

      ;; (merge lon1 lon2)
      (merge1 (equal?? (merge '(1 4) '(1 2)) (1 1 2 4)))
      (merge2 (equal?? (merge '() '()) ()))
      (merge3 (equal?? (merge '(1 4) '(1 1 2 8)) (1 1 1 2 4 8)))
      (merge4 (equal?? (merge '(1 4) '(1 2 2 8)) (1 1 2 2 4 8)))
      (merge5 (equal?? (merge '() '(2 8)) (2 8)))

      ;; (ribassoc s los v fail-value)
      (ribassoc1 (equal?? (ribassoc 'c '(a b c) '#(1 2 3) 'fail) 3))
      (ribassoc2 (equal?? (ribassoc 'b '(a b foo) '#(3 squiggle bar) 'fail) squiggle))
      (ribassoc3 (equal?? (ribassoc 'r '(a i r i) '#(fx (fz) () (fm fe)) 'whatever) ()))
      (ribassoc4 (equal?? (ribassoc 'p '(a i r i) '#(fx (fz) () (fm fe)) 'whatever) whatever))
      (ribassoc5 (equal?? (ribassoc 'p '(a i r p) '#(fx (fz) () (fm fe)) 'whatever) (fm fe)))
      
      ;; (rotate los)
      (rotate1 (equal?? (rotate '(a b d)) (d a b)))
      (rotate2 (equal?? (rotate '(c a g)) (g c a)))
      (rotate3 (equal?? (rotate '(c a t)) (t c a)))
      (rotate4 (equal?? (rotate '(c)) (c)))
      (rotate5 (equal?? (rotate '(c a)) (a c)))

      )
    )
  )