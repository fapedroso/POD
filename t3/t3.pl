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

countdown(0,L):-
  L = []
  .
countdown(N,L) :-
  L = [N|T],
  Ns is N-1,
  countdown(Ns,T)
  .

nRandoms(0,L) :-
  L = []
  .
nRandoms(N,L) :-
  random_between(0, 99, H),
  L = [H|T],
  Ns is N-1,
  nRandoms(Ns,T)
  .

pot(N,0,1).
pot(N,M,X) :-
  Ms is M-1,
  pot(N,Ms,Xs),
  X is N * Xs
  .

potN0(0,L) :-
  pot(2,0,H),
  L = [H]
  .
potN0(N,L) :-
  pot(2,N,H),
  L = [H|T],
  Ns is N-1,
  potN0(Ns,T)
  .


