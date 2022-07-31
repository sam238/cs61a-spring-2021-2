(define-macro (switch expr cases)
  (cons 'cond
        (map (lambda (case)
                        (cons `(eqv? ',(car case) ,expr) (cdr case)))
             cases)))
