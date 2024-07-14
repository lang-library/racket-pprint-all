#lang scribble/manual

@title{Pretty-Printing Library for Racket}

@author[(author+email "JavaCommons Technologies" "javacommons@gmail.com")]

@defmodule[pprint-all]

This basically provides @racket[pp], @racket[echo], and @racket[dump].

@table-of-contents[]

@section{Example and usage}

@codeblock|{
#lang racket/base
(require pprint-all)

(define x (+ 11 22))
(echo x)
(echo x "x") ;; with title
(echo (list x 777))
(dump (list x 777)) ;; (list x 777) ==> (33 777)
(pp "hello \nworld") ;; pp quotes string
(echo "hello \nworld" "msg") ;; echo unquotes string
(echo (pp->string (list x 777)))
(dump (pp->string (list x 777)))
(echo "abc\r\n" "quote" #:unquote-string? #f)
(dump "abc\r\n" #:unquote-string? #f)
}|

@section{Reference}

@defform[(pp x [port (current-output-port)] #:unquote-string? [unquote-string? #f])]{
Pretty-print x to the port.
}

@defform[(pp->string x  #:unquote-string? [unquote-string? #f])]{
Pretty-print to a string.
}

@defform[(print->string x)]{
@racket[print] to a string.
}

@defform[(echo x [title ""] [port (current-output-port)]  #:unquote-string? [unquote-string? #t])]{
Pretty-print x to the port with an optional title.
}

@defform[(dump x [port (current-output-port)]  #:unquote-string? [unquote-string? #t])]{
Pretty-print x to the port with an auto-generated title.
}
