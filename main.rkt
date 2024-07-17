#lang racket
(require compatibility/defmacro)
(require pprint)
(require "./ppobj.rkt")
(require "./ppdoc.rkt")
(require "./remove-last-newline.rkt")

#;(define printing-semaphore (make-semaphore))

(define (pp x [port (current-output-port)] #:unquote-string? [unquote-string? #f])
  (if (doc? x)
      (ppdoc x (sync port))
      (ppobj x (sync port) #:unquote-string? unquote-string?)
      )
  )

(define (pp->string x  #:unquote-string? [unquote-string? #f])
  (let* ([op (open-output-string)]
         [_ (pp x op #:unquote-string? unquote-string?)]
         [s (get-output-string op)])
    (remove-last-newline s)
    )
  )

(define (print->string x)
  (let* ([op (open-output-string)]
         [_ (print x op)]
         [s (get-output-string op)])
    (cond
      ((string-prefix? s "'")
       (set! s (substring s 1))
       )
      )
    (remove-last-newline s)
    )
  )

(define (echo x [title ""] [port (current-output-port)]  #:unquote-string? [unquote-string? #t])
  (let* ([msg (pp->string x #:unquote-string? unquote-string?)])
    (cond
      ((not (equal? title ""))
       (set! msg (format "~a ==> ~a" title msg))
       )
      )
    (displayln msg (sync port))
    )
  )

(define-macro (dump x . rest)
  `(echo ,x ,(format "~s" x) ,@rest)
  )

(provide pp pp->string print->string echo dump remove-last-newline)
