% We create the transitions for the automaton
transition(q0,a,q1).
transition(q0,c,q0).
transition(q0,b,q4).
transition(q1,a,q1).
transition(q1,c,q0).
transition(q1,b,q2).
transition(q2,a,q1).
transition(q2,b,q4).
transition(q2,c,q3).
transition(q4,a,q1).
transition(q4,b,q5).
transition(q4,c,q7).
transition(q5,a,q6).
transition(q5,b,q4).
transition(q5,c,q7).
transition(q7,a,q1).
transition(q7,b,q4).
transition(q7,c,q0).

%Final state
final_state(q7).

recover_automaton(ListtoCheck) :-
    automatonCheck(ListtoCheck, q0).

% Base case, it ends if it ends on the final state
automatonCheck([], InitialState) :-
    final_state(InitialState).

automatonCheck([Symbol | RestofList], InitialState) :-
    transition(InitialState, Symbol, NextState),
    automatonCheck(RestofList, NextState).
