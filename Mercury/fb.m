:- module fb.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module int, string, bool.
 
:- func fizz(int) = bool.
fizz(N) = ( if N mod 3 = 0 then yes else no ).
 
:- func buzz(int) = bool.
buzz(N) = ( if N mod 5 = 0 then yes else no ).
 
%                N    3?    5?
:- func fizzbuzz(int, bool, bool) = string.
fizzbuzz(_, yes, yes) = "FizzBuzz".
fizzbuzz(_, yes, no)  = "Fizz".
fizzbuzz(_, no,  yes) = "Buzz".
fizzbuzz(N, no,  no)  = from_int(N).
 
main(!IO) :- main(1, 15, !IO).
 
:- pred main(int::in, int::in, io::di, io::uo) is det.
main(N, To, !IO) :-
    io.write_string(fizzbuzz(N, fizz(N), buzz(N)), !IO),
    io.nl(!IO),
    ( if N < To then
        main(N + 1, To, !IO)
    else
        true
    ).