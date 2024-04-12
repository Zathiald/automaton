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
we will implement an automaton using q states, an automaton is a finite machine composed of different states, this machine helps us read a set of characters and determine what the final output will be, after designing it this is the result

![Automata evidence 1](https://github.com/Zathiald/automaton/assets/111139805/5dd46a2c-f45b-4341-9380-eff2b9601d73)

One thing we must take into account is that because of the rules of the automaton we have some states that are not finite because if the sequence has one of the rules then it can't go to the end state.

The automaton works in the following manner:

| Starting State | Input | Final State |
| -------------- | ------| ----------- |
| Q0             | A     | Q1          |
| Q0             | B     | Q4          |
| Q0             | C     | Q0          |
| Q1             | A     | Q1          |
| Q1             | B     | Q2          |
| Q1             | C     | Q0          |
| Q2             | A     | Q1          |
| Q2             | C     | Q3          |
| Q4             | A     | Q1          |
| Q4             | B     | Q5          |
| Q4             | C     | Q7          |
| Q5             | A     | Q6          |
| Q5             | B     | Q4          |
| Q5             | C     | Q7          |
| Q7             | A     | Q1          |
| Q7             | B     | Q4          |
| Q7             | C     | Q0          |



For further implementation are goint to transcribe the automaton to a Regular Expression (R.E):

<strong>^(?!.*abc)(?!.*bba).*bc$</strong>

## Implementation
Now after we have made our automaton we have to translate the progress to a prolog file in order for it to be tested and modified if necessary, what we first need is to implement the relations of the states, we will put them in the next format: 

<strong>transition(initial_state,letter,next_state)</strong>

So for example on the initial state of Q0 if we ingress the letter a then we go to the state Q1, so in prolog it would look like this:

<strong>transition(q0,a,q1)</strong>

So after stablishing all the states we need for prolog to now which is an accepting state, we will create a function called final_state in which we stablish that if it is on the state, then it is true
<strong>final_state(q7)</strong>

Now we create a function to check in order for it to check the automaton, we are going to use a head recursion because we want to go from the beggining all the way to the base case which is our final state, so we will start by creating the base case for our function which we will call automatonCheck
<strong>automatonCheck([], InitialState) :-
    final_state(InitialState).)</strong>
    
On this base case we will take a list and the starting state for the cycle, now for the recurssion we need to recover the automaton again and then check with the new state as the initial, so we plant it like this

<strong>automatonCheck([Symbol | RestofList], InitialState) :-
    transition(InitialState, Symbol, NextState),
    automatonCheck(RestofList, NextState).</strong>

We first make the transition to the next state and we check if we are at the end of the string and at the final state, if not we re do the automaton check with the next state and letter and it will end once we get q7 as the final state.

And at the end we will use this function of recover_automaton so we can input the string as a list and initiate it on the q0 state

<strong>recover_automaton(ListtoCheck) :-
    automatonCheck(ListtoCheck, q0).</strong>

The complexity for this system is O(n), that is because our regression system needs to go through the n number of letters in the list input, but it goes through them just one time, giving it it's O(n) complexity.

## Testing
The testing for this automaton is written on the file <strong>automaton_test.pl</strong>, but these were the results for it
![Automaton testing complete](https://github.com/Zathiald/automaton/assets/111139805/aeaa37f4-d924-4965-8690-beae39e9e860)

## References
These references were provided thanks to the documents in which the automatons are explained.

Epita. (n.d.). An introduction to Prolog!. Boklm. Retrieved 24 March. 2024, from https://boklm.eu/prolog/page_6.html#61.

Geeksforgeeks. (2023, June 27). Introduction of Finite Automata - GeeksforGeeks. Geeksforgeeks. Retrieved 24 March. 2024, from https://geeksforgeeks.org/introduction-of-finite-automata/.

Treasure-Jones, T. (1996, October 8). Prolog Tutorial - Lists. Doc. Retrieved 24 March. 2024, from https://doc.gold.ac.uk/~mas02gw/prolog_tutorial/prologpages/lists.html.

Warren, D. (1999, July 31). Grammars in Prolog. Stonybrook. Retrieved 24 March. 2024, from https://www3.cs.stonybrook.edu/~warren/xsbbook/node10.html.



