odd(N) :- 
  C = mod(N,2),
  C =:= 0
  .
tamLis([],0).
tamLis([H|T],N) :-
  tamLis(T,N1),
  N is N1 + 1
  .

hasN(L,N) :-
  tamLis(L,N1),
  N1 =:= N
  .
