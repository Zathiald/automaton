?- recover_automaton([a,b,b,c,b,a,b,c]).
false.

?- recover_automaton([a,b,b,c]).
true .

?- recover_automaton([a,b,b,b,a,b,c]).
false.

?- recover_automaton([a,b,b,b,b,c]).
true .

?- recover_automaton([a,b,c]).
false.

?- recover_automaton([b,b,a]).
false.

?- recover_automaton([b,c]).
true.

