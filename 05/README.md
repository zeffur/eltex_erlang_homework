Задание 1:  

    1> c("persons.erl").  
    {ok,persons}  
    2> rr("person.hrl").  
    [person]  
    3> Persons = [#person{id = 1, name = "Bob", age = 23, gender = male}, #person{id = 2, name = "Kate", age = 20, gender = female}, #person{id = 3, name = "Jack", age = 34, gender = male}, #person{id = 4, name = "Nata", age = 54, gender = female}].  
    [#person{id = 1,name = "Bob",age = 23,gender = male},  
     #person{id = 2,name = "Kate",age = 20,gender = female},  
     #person{id = 3,name = "Jack",age = 34,gender = male},  
     #person{id = 4,name = "Nata",age = 54,gender = female}]  
    4> persons:filter(fun(#person{age = Age}) -> Age >= 30 end, Persons).  
    [#person{id = 3,name = "Jack",age = 34,gender = male},  
     #person{id = 4,name = "Nata",age = 54,gender = female}]  
    5> persons:filter(fun(#person{gender = Gender}) -> Gender == male end, Persons).  
    [#person{id = 1,name = "Bob",age = 23,gender = male},  
     #person{id = 3,name = "Jack",age = 34,gender = male}]  
    6> persons:any(fun(#person{gender = Gender}) -> Gender == female end, Persons).  
    true  
    7> persons:all(fun(#person{age = Age}) -> Age >= 20 end, Persons).  
    true  
    8> persons:all(fun(#person{age = Age}) -> Age =< 30 end, Persons).  
    false  
    9> UpdateJackAge = fun(#person{name = "Jack", age = Age} = Person) -> Person#person{age = Age + 1}; (Person) -> Person end.  
    #Fun<erl_eval.44.65746770>  
    10> persons:update(UpdateJackAge, Persons).  
    [#person{id = 1,name = "Bob",age = 23,gender = male},  
     #person{id = 2,name = "Kate",age = 20,gender = female},  
     #person{id = 3,name = "Jack",age = 35,gender = male},  
     #person{id = 4,name = "Nata",age = 54,gender = female}]  
    11> UpdateFemaleAge = fun(#person{gender = female, age = Age} = Person) -> Person#person{age = Age - 1}; (Person) -> Person end.  
    #Fun<erl_eval.44.65746770>  
    12> persons:update(UpdateFemaleAge, Persons).  
    [#person{id = 1,name = "Bob",age = 23,gender = male},  
     #person{id = 2,name = "Kate",age = 19,gender = female},  
     #person{id = 3,name = "Jack",age = 34,gender = male},  
     #person{id = 4,name = "Nata",age = 53,gender = female}]  

Все описанные функции верно отработали на заданных тестовых вызовах. Обратим внимание, что в последних двух случаях (обновление данных персон) были затронуты лишь те записи, изменение которых требовалось в задании, что подтверждает правильное описание заданных функций и их отработку.  

Задание 2:  

    13> [X || X <- lists:seq(1,10), X rem 3 == 0].  
    [3,6,9]  
    14> [X * X || X <- [1, "hello", 100, boo, "boo", 9], is_integer(X)].  
    [1,10000,81]  

Задание 3:  

    1> c("exceptions.erl").  
    {ok,exceptions}  
    2> exceptions:catch_all(fun() -> 1/0 end).  
    Action #Fun<erl_eval.45.65746770> failed, reason badarith  
    error  
    3> exceptions:catch_all(fun() -> throw(custom_exceptions) end).  
    Action #Fun<erl_eval.45.65746770> failed, reason custom_exceptions  
    throw  
    4> exceptions:catch_all(fun() -> exit(killed) end).  
    Action #Fun<erl_eval.45.65746770> failed, reason killed  
    exit  
    5> exceptions:catch_all(fun() -> erlang:error(runtime_exception) end).  
    Action #Fun<erl_eval.45.65746770> failed, reason runtime_exception  
    error  

Выводы вызванной функции соответствуют типам посланным ей exceptions, в случае чего делаем вывод о правильной работе функции.

