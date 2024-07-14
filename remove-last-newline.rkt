#lang racket
(define (remove-last-newline s)
  (cond
    ((string-suffix? s "\r\n")
     (substring s 0 (- (string-length s) 2))
     )
    ((string-suffix? s "\r")
     (substring s 0 (- (string-length s) 1))
     )
    ((string-suffix? s "\n")
     (substring s 0 (- (string-length s) 1))
     )
    (#t s)
    )
  )

(provide remove-last-newline)
