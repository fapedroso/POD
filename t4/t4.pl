vitma(anita).

insano(adriano).
insano(maria).

relacionamento(caren,bernardo).
relacionamento(bernardo,caren).
relacionamento(anita,bernardo).
relacionamento(bernardo,anita).
relacionamento(anita,pedro).
relacionamento(pedro,anita).
relacionamento(alice,pedro).
relacionamento(pedro,alice).
relacionamento(alice,henrique).
relacionamento(henrique,alice).
relacionamento(maria,henrique).
relacionamento(henrique,maria).
relacionamento(maria,adriano).
relacionamento(adriano,maria).
relacionamento(caren,adriano).
relacionamento(adriano,caren).

pobre(bia).
pobre(bernardo).
pobre(pedro).
pobre(maria).

motivo(X) :-
  insano(X);
  pobre(X);
  relacionamento(X,Y),
  relacionamento(Y,Z),
  vitma(Y);
  relacionamento(Z,X),
  relacionamento(Z,Y),
  vitma(Y),
  !
  .

agenda(pedro,[sm,sm,poa,sm,ap]).
agenda(caren,[poa,poa,poa,sm,ap]).
agenda(henrique,[ap,poa,ap,ap,ap]).
agenda(bia,[ap,poa,poa,sm,ap]).
agenda(adriano,[ap,ap,sm,ap,ap]).
agenda(alice,[ap,poa,poa,ap,ap]).
agenda(bernardo,[sm,sm,poa,sm,ap]).
agenda(maria,[ap,sm,sm,sm,ap]).

acessoChave(X) :-
  X = bia;
  agenda(X,L1),
  nth0(1,L1,Ter),
  Ter = poa;
  agenda(X,L2),
  nth0(2,L2,Qua),
  Qua = sm,
  !
  .

acessoArma(X) :-
  agenda(X,L1),
  nth0(2,L1,QuaBastao),
  QuaBastao = sm;
  agenda(X,L2),
  nth0(3,L2,QuiBastao),
  QuiBastao = poa;
  agenda(X,L3),
  nth0(2,L3,QuaMartelo),
  QuaMartelo = ap;
  agenda(X,L4),
  nth0(3,L4,QuiMartelo),
  QuiMartelo = ap,
  !
  .

acessoLocal(X) :-
  agenda(X,L1),
  nth0(3,L1,Qui),
  Qui = ap;
  agenda(X,L2),
  nth0(4,L2,Sex),
  Sex = ap,
  !
  .

acesso(X) :-
  acessoChave(X),
  acessoArma(X),
  acessoLocal(X),
  !
  .

assassino(X) :-
  acesso(X),
  motivo(X),
  !
  .
