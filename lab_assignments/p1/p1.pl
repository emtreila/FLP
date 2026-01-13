% 10. a. Define a predicate to test if a list of an integer elements has
% a "valley" aspect (a set has a "valley" aspect if
% elements decreases up to a certain point, and then increases.
% eg: 10 8 6 9 11 13 – has a “valley” aspect

%valley(List):
%	valley(i)
%	valley_down(i,i)
%	valley_up(i,i)

%valley(List)={ false, if list has less than 3 elements
%               true , if the first element is bigger than the second
% element and valley_down(PrevElem, RemainderOfTheList) is true

% valley_down(Prev, [X|R])={ false , if we get to the end of the list
% (because the numbers must go "up" -> valley_up)
%                            false , if there are 2 numbers equal
%                            valley_down([X|R]), X < Prev
%                            valley_up([X|R])  , X > Prev

% valley_up(Prev, [CurrentElem | RestOfList])={ true, if we get to the
%  end of the list
%						X > Prev and Up([X|R])


% the list must have at least 3 elements
valley([]) :- fail.
valley([_]):- fail.
valley([_,_]):- fail.

% the valley must start by going down so we enforce at least 3 elements
valley([A,B,C|D]):-
    A>B,
    valley_down(B,[C|D]).


valley_down(Prev,[X|Y]):-
    (   X<Prev -> valley_down(X,Y)
    ;   X>Prev -> valley_up(X,Y)
    ;   X=:=Prev -> fail
    ).

% ending while goign down is not a valley
valley_down(_,[]) :- fail.

% if we reach the valley_up but the list ends its a valley
valley_up(_,[]).

valley_up(Prev,[X|Y]):-
    X>Prev,
    valley_up(X,Y).


% b. Calculate the alternate sum of list’s elements (l1 - l2 + l3 ...).

%sum(List,Sum):
%	sum(i,o)
%	plus(i,o)
%	minus(i,o)

%sum(List,Sum)={  plus(List,Sum)

%plus(List,Sum)={ 0                  , if the list is empty
%		  x + minus(Rest,Sum), otherwise

%minus(List,Sum){  0                 , if the list is empty
%		  -x + plus(Rest,Sum), otherwise

sum(L,S) :- plus(L,S).
plus([],0).
plus([M|N],S) :-
    minus(N,Rest),
    S is M + Rest.
minus([],0).
minus([M|N],S) :-
    plus(N,Rest),
    S is -M + Rest.
