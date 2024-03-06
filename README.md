# E1 Implementation of Lexical Analysis (Automaton and Regular Expression)
Samir Baidon Pardo A01705403

## Description
The language choosen for this evidence is the math language, 
more especiffically one in which you can have al possible combinations of abc
although there is a catch as there are three rules to follow

1. It must not have abc
2. It must not have bba
3. It must finish in bc

Seeing as we only have three letters in our language it would be better to use a 
non-deterministic finite automaton (NFA) for this problem, as it can give us more flexibility and links

## Design

Seeing that our language is 
Σ = a,b,c
we will implement the automaton using q states, after designing it this is the result

![Automata evidence 1](https://github.com/Zathiald/automaton/assets/111139805/5dd46a2c-f45b-4341-9380-eff2b9601d73)

For further implementation are goint to transcribe the automaton to a Regular Expression (R.E):

<strong>^(?!.*abc)(?!.*bba).*bc$</strong>

## Implementation
Now after we have made our automaton we have to translate the progress to a prolog file in order for it to be tested and modified if necessary, what we first need is to implement the relations of the states, we will put them in the next format: 

<strong>transition(initial_state,letter,next_state)</strong)

So for example on the initial state of Q0 if we ingress the letter a then we go to the state Q1, so in prolog it would look like this:

<strong>transition(q0,a,q1)</strong)

So after stablishing all the states we need for prolog to now which is an accepting state, we will create a function called final_state in which we stablish that if it is on the state, then it is true
<strong>final_state(q7)</strong)

Now we create a function to check in order for it to check the automaton, we are going to use a head recursion because we want to go from the beggining all the way to the base case which is our final state, so we will start by creating the base case for our function which we will call automatonCheck
<strong>automatonCheck([], InitialState) :-
    final_state(InitialState).)</strong)
    
On this base case we will take a list and the starting state for the cycle, now for the recurssion we need to recover the automaton again and then check with the new state as the initial, so we plant it like this

<strong>automatonCheck([Symbol | RestofList], InitialState) :-
    transition(InitialState, Symbol, NextState),
    automatonCheck(RestofList, NextState).</strong)

We first make the transition to the next state and we check if we are at the end of the string and at the final state, if not we re do the automaton check with the next state and letter and it will end once we get q7 as the final state.

And at the end we will use this function of recover_automaton so we can input the string as a list and initiate it on the q0 state

<strong>recover_automaton(ListtoCheck) :-
    automatonCheck(ListtoCheck, q0).</strong)



