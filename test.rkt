#lang racket
(require "./main.rkt")

(define x (+ 11 22))
(echo x)
(echo x "x")
(echo (list x 777))
(dump (list x 777))
(pp "hello \nworld")
(echo "hello \nworld" "msg")
(echo ''123)
(echo 'abc)
(echo ''abc)
