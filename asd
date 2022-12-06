(define (nthItem l item currentItem)
    (if (null? l) '()
      (if (= currentItem item) (car l)
        (nthItem (cdr l) item (+ currentItem 1)))))

(define (diagPrivate m i)
  (if (null? m) '()
    (cons (nthItem (car m) i 0)
      (diagPrivate (cdr m) (+ i 1)))))
      
(define (diag m)
    (diagPrivate m 0))

(writeln (diag '((1 2 3) (4 5 6) (7 8 9)))) ;(1 5 9)


(define (reduce f2 neutral list) (foldr f2 neutral list))

(define (rmap f lst)    
 (reduce (lambda (x y) (cons (f x) y)) empty lst))

(writeln (rmap add1 (list 1 2 3 4))) ;(2 3 4 5)


;stackoverflow
(define (member? item seq)
  (sequence-ormap (lambda (x)
                    (equal? item x))
                  seq))

(writeln (member? 1 (list 1 2 3 4))) ;t
(writeln (member? 'a '(a e i o u))) ;t
(writeln (member? 7 17)) ;t
(writeln (member? #\e "Hello")) ;t
