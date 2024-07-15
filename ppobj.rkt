#lang racket
(require racket/pretty)

(define (pretty-print->string x #:unquote-string? [unquote-string? #f])
  (cond
    ((and unquote-string? (string? x))
     (format "~a" x) ;;(format "\"~a\"" x)
     )
    (#t
      (let* ([op (open-output-string)]
             [_ (pretty-print x op)]
             [s (get-output-string op)])
        (string-trim s)
        )
      )
    )
  )

(define (ppobj x [port (current-output-port)] #:unquote-string? [unquote-string? #f])
  (let* ([msg (pretty-print->string x #:unquote-string? unquote-string?)])
    (cond
      ((and
        (not (string? x))
        (string-prefix? msg "'")
        )
       (set! msg (substring msg 1))
       )
      )
    (displayln msg port)
    )
  )

(provide ppobj)
