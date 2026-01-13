% II. Chairs must be arranged for a show. There are red chairs and yellow chairs.
% One row contains 5 chairs.
% Find all the possible arrangements of chairs on a row, knowing that
% there can be at most 3 yellow chairs on a row. Write the mathematical
% model, flow model and the meaning of all variables for each predicate
% used. Some elements in the solution: ['Y','R','R','R','R'],
% ['R','Y','Y','R','R'], ['Y','Y','Y','R','R'], ['R','Y','Y','R','Y'],
% etc.




% row(n,k) = { [], n = 0
%              R U row(n-1,k), n > 0
%              Y U row(n-1,k-1), n > 0 and k > 0
% row(i,i,o)
% N = number of positions left
% K = number of Y chairs still allowed
% R = resulting row
row(0,_,[]).
row(N,K,['R'|RES]):-
    N > 0,
    N1 is N - 1,
    row(N1, K, RES).
row(N,K,['Y'|RES]):-
    N > 0,
    K > 0,
    N1 is N - 1,
    K1 is K - 1,
    row(N1, K1, RES).

solve(R):-
    row(5,3,R).
