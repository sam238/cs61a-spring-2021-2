(define (split-at lst n) 
    (define (loop l1 lst n)
        (if (or (= n 0) (null? lst)) 
            (cons l1 lst)
            (loop (append l1 (list (car lst))) (cdr lst) (- n 1))
        )
    )
    (loop '() lst n)
)


(define (compose-all funcs) 
    (define (f x)
        (if (null? funcs) x
            ((compose-all (cdr funcs)) ((car funcs) x))
        )
    )
    f
)
