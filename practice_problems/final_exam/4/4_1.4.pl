% 1.4 Consider a PROLOG predicate p(integer), with the flow model (i)

p(100).
p(N):-
    write(N),
    N1 is N-1,
    p(N1).

% Give the effect of the goal: p(0)

-> it will be an inifinite loop because we never get to 100 for the function to stop
