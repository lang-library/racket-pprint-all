#lang racket
(require compatibility/defmacro)
(require pprint)
(require "./ppobj.rkt")
(require "./ppdoc.rkt")

(define (pp x [port (current-output-port)] #:unquote-string? [unquote-string? #f])
  (if (doc? x)
      (ppdoc x port)
      (ppobj x port #:unquote-string? unquote-string?)
      )
  )

(define (pp->string x  #:unquote-string? [unquote-string? #f])
  (let* ([op (open-output-string)]
         [_ (pp x op #:unquote-string? unquote-string?)]
         [s (get-output-string op)])
    (string-trim s)
    )
  )

(define (print->string x)
  (let* ([op (open-output-string)]
         [_ (print x op)]
         [s (get-output-string op)])
    (string-trim s)
    )
  )

(define (echo x [title ""] [port (current-output-port)])
  (let* ([msg (pp->string x #:unquote-string? #t)])
    (cond
      ((not (equal? title ""))
       (set! msg (format "~a ==> ~a" title msg))
       )
      )
    (displayln msg port)
    )
  )

(define-macro (dump x . rest)
  `(echo ,x ,(format "~s" x) ,@rest)
  )

(provide pp pp->string print->string echo dump)
