#lang racket/base
(require "./main.rkt")

(define x (+ 11 22))
(echo x)
(echo x "x") ;; with title
(echo (list x 777))
(dump (list x 777)) ;; (list x 777) ==> (33 777)
(pp "hello \nworld") ;; pp quotes string
(echo "hello \nworld" "msg") ;; echo unquotes string
(echo (pp->string (list x 777)))
(dump (pp->string (list x 777)))
(dump (print->string (list x 777)))
(echo "abc\r\n" "quote" #:unquote-string? #f)
(dump "abc\r\n" #:unquote-string? #f)
