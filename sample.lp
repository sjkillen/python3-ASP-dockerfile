% Demonstrates using Python to load CSV data at grounding-time
% Author: Spencer Killen

#script (python)
from clyngor.upapi import converted_types
from csv import reader

data = list(reader(open("input.csv", "rt", encoding="utf8")))

def false():
    return
    yield None

def facts():
    rows = iter(data)
    next(rows, None)
    for id, name, age in rows:
        yield int(id), name, age

@converted_types
def nameStartsWithLetter(name: str, letter: str):
    return name if name[0].lower() == letter.lower() else false()

#end.

data(@facts()).
id(ID) :- data((ID, _, _)).
name(Name) :- data((_, Name, _)).
age(Age) :- data((_, _, Age)).

nameStartsWithB(@nameStartsWithLetter(Name, "B")) :- name(Name).

#show nameStartsWithB/1.
