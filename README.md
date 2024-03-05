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

<span>![</span><span>Imagen de Automaton</span><span>]</span><span>(</span><span>https://github.com/Zathiald/automaton/blob/main/Automata.png</span><span>)</span>
