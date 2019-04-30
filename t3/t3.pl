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
inc99([],[]).
inc99(L1,L2) :-
  L1 = [H|T],
  L3 is H + 99,
  inc99(T,L4),
  L2 = [L3|L4]
  .

incN([],[],N).
incN(L1,L2,N) :-
  L1 = [H|T],
  L3 is H + N,
  incN(T,L4,N),
  L2 = [L3|L4]
  .

comment([],[]).
comment(L1,L2) :-
  L1 = [H|T],
  string_concat("%%",H,L3),
  comment(T,L4),
  L2 = [L3|L4]
  .

onlyEven([],[]).
onlyEven(L1,L2) :-
  L1 = [H|T],
  not(odd(H)),
  onlyEven(T,L3),
  L2 = L3
  .

onlyEven(L1,L2) :-
  L1 = [H|T],
  odd(H),
  onlyEven(T,L3),
  L2 = [H|L3]
  .
