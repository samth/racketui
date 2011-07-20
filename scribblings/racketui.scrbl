#lang scribble/doc

@(require scribble/manual planet/scribble)

@title[#:tag "top"]{RacketUI: Automated Web UI Generator}
@author{@(author+email "Nadeem Abdul Hamid" "nadeem@acm.org")}

RacketUI is intended to be a teachpack to provide facilities for the
quick and easy generation of web interfaces for programs written in 
the HtDP (@italic{How to Design Programs}) student languages of Racket
(see @hyperlink["http://docs.racket-lang.org" "http://docs.racket-lang.org"]).

@section[#:tag "example"]{Quick Example}

Consider the following program, which builds an acronym from the
capitalized words in a list of strings (comments and test cases are
omitted):

@racketblock[
(define (acronym a-los)
  (cond [(empty? a-los) ""]
        [(cons? a-los)
          (cond 
            [(string-upper-case? (string-ith (first a-los) 0))
             (string-append (string-ith (first a-los) 0)
                            (acronym (rest a-los)))]
            [else (acronym (rest a-los))])]))
]

A web application for this can be automatically generated using:

@racketblock[
(require (planet nah22/racketui))

(web-launch
 "Acronym Builder"
 (function "Produces an acronym of the capitalized words in the given list."
           (acronym ["Words" (listof+ ["Word" string+])]
                    ->["The acronym" string])))
]

Running this program should launch a web browser with an user
interface allowing input of a list of words (strings) and the
ability to apply the function to that input to view the result.


