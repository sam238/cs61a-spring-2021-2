(define (tail-replicate x n) 
  (define (loop res n)
    (if (= n 0) res
      (loop (cons x res) (- n 1))
    )
  )
  (loop '() n)
)

(define-macro (def func args body)
  `(define (,func ,@args) ,body)
)

(define (repeatedly-cube n x)
  (if (zero? n)
      x
      (let (y (repeatedly-cube (- n 1) x))
        (* y y y))))
