-module(persons).

-include("person.hrl").

-export([filter/2, all/2, any/2, update/2, get_average_age/1]).

filter(Fun, Persons) -> lists:filter(Fun, Persons).

all(Condition, Persons) -> lists:all(Condition, Persons).

any(Condition, Persons) -> lists:any(Condition, Persons).

update(Fun, Persons) -> lists:map(Fun, Persons).

get_average_age(Persons) ->
  {AgeSum, PersonsCount} = lists:foldl(fun(X, {Sum, PerCount}) -> {X#person.age + Sum, 1 + PerCount} end, {0,0}, Persons),
  case PersonsCount of
    0 -> 0;
    _ -> AgeSum/PersonsCount
  end.

% Persons = [#person{id = 1, name = "Bob", age = 23, gender = male}, #person{id = 2, name = "Kate", age = 20, gender = female}, #person{id = 3, name = "Jack", age = 34, gender = male}, #person{id = 4, name = "Nata", age = 54, gender = female}].
