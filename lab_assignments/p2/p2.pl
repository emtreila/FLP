% 10. a) For a list of integer numbers, define a predicate to write
% twice in list every prime number.


% is_prime(nr) = { false, nr < 2 || divisible_by_any == TRUE
%                  true , divisible_by_any == FALSE
%
% divisible(nr,div) = { false, nr % div != 0
%                       true , nr % div == 0

% divisible_by_any(nr, div) = {true, div*div <= nr && (divisible(nr,div)== TRUE || divisible_by_any(nr,div++)
%                               false, otherwise
%
% is_prime(i)
% divisible(i,i)
% divisible(i,i)


is_prime(X) :-
    X > 1,
    not(divisible_by_any(X, 2)).


divisible(X, Y) :- X mod Y =:= 0.


divisible_by_any(X, Y) :-
    Y*Y =< X,
    (divisible(X, Y);
     Y1 is Y + 1,
     divisible_by_any(X, Y1)).


% write_twice(l1...ln) = { [], if n = 0
%                          l1 U l1 U write_twice(l2...ln),if l1 is prime
%                          l1 U write_twice(l2...ln), if l1 is not prime
%
% write_twice(i,o)


write_twice([],[]).
write_twice([H|T],[H,H|R]):-
    is_prime(H), !,
    write_twice(T,R).
write_twice([H|T],[H|R]):-
    write_twice(T,R).


% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, define a predicate to write in
% every sublist twice every prime number.
% Eg.: [1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5] =>
% [1, [2, 2, 3, 3], 4, 5, [1, 4, 6], 3, [1, 3, 3, 7, 7, 9, 10], 5]

% write_list(l1...ln) = { [], if n = 0
%                       write_twice(l1) U write_list(l2...ln),if l1=list
%                       l1 U write_twice(l2...ln), otherwise
% write_list(i,o)


write_list([],[]).
write_list([H|T],[H2|R]):-
    is_list(H), !,
    write_twice(H,H2),
    write_list(T,R).
write_list([H|T],[H|R]):-
    write_list(T,R).
