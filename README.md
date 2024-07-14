# Pretty-Printing Library for Racket

by JavaCommons Technologies
<[javacommons@gmail.com](mailto:javacommons@gmail.com)>

 (require pprint-all)
 package: [pprint-all](https://pkgs.racket-lang.org/package/pprint-all)

This basically provides `pp`, `echo`, and `dump`.

    1 Example and usage
                       
    2 Reference        

## 1. Example and usage

```racket
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
```

## 2. Reference

```racket
(pp x [port (current-output-port)]           
      #:unquote-string? [unquote-string? #f])
```

Pretty-print x to the port.

```racket
(pp->string x                                      
            #:unquote-string? [unquote-string? #f])
```

Pretty-print to a string.

```racket
(print->string x)
```

`print` to a string.

```racket
(echo x [title ""] [port (current-output-port)]
        #:unquote-string? [unquote-string? #t])
```

Pretty-print x to the port with an optional title.

```racket
(dump x [port (current-output-port)]           
        #:unquote-string? [unquote-string? #t])
```

Pretty-print x to the port with an auto-generated title.
