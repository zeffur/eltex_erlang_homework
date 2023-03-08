Задание 1:  
1> rr("converter.hrl").  
[conv_info]  
2> c("converter.erl").  
{ok,converter}  
3> converter:rec_to_rub(#conv_info{type = usd, amount = 100, commission = 0.01}).  
{ok,7474.5}  
4> converter:rec_to_rub(#conv_info{type = peso, amount = 12, commission = 0.02}).  
{ok,35.28}  
5> converter:rec_to_rub(#conv_info{type = yene, amount = 30, commission = 0.02}).  
Can't convert to rub, error {conv_info,yene,30,0.02}  
{error,badarg}  
6> converter:rec_to_rub(#conv_info{type = euro, amount = -15, commission = 0.02}).  
Can't convert to rub, error {conv_info,euro,-15,0.02}  
{error,badarg}  

Для полноценной работы данной части работы необходимо было дополнительно создать заголовочный файл с описанием структуры записи conv_info (converter.hrl). А затем подгрузить его командой rr("converter.hrl"). для восприятия вышеуказанных функций оболочкой Erlang.  

    converter.hrl:  

    -record(conv_info,{  
      type,  
      amount,  
      commission  
    }).  

Задание 2:  
7> c("converter.erl").  
{ok,converter}  
8> converter: map_to_rub(#{type => usd, amount => 100, commission => 0.01}).  
{ok,7474.5}  
9> converter: map_to_rub(#{type => peso, amount => 12, commission => 0.02}).  
{ok,35.28}  
10> converter: map_to_rub(#{type => yene, amount => 30, commission => 0.02}).  
Can't convert to rub, error #{amount => 30,commission => 0.02,type => yene}  
{error,badarg}  
11> converter: map_to_rub(#{type => euro, amount => -15, commission => 0.02}).  
Can't convert to rub, error #{amount => -15,commission => 0.02,type => euro}  
{error,badarg}  

Использование функций с мап в качестве параметра также закончилось успешно. Результат отработки кода соответствовал описанной логике и был идентичен результату кода Задания 1 по причине одинакового принципа вычисления.  

Задание 3.1:  
12> c("recursion.erl").  
{ok,recursion}  
13> recursion:tail_fac(5).  
120  
14> recursion:tail_fac(0).  
1  

Задание 3.2:  
15> c("recursion.erl").  
{ok,recursion}  
16> recursion:duplicate([1,2,3]).  
[1,1,2,2,3,3]  
17> recursion:duplicate([]).  
[]  
18> c("recursion.erl").  
{ok,recursion}  
19> recursion:tail_duplicate([1,2,3]).  
[1,1,2,2,3,3]  
20> recursion:tail_duplicate([]).  
[]  

Задание 4:  
21> Fac = fun recursion:tail_fac/1.  
fun recursion:tail_fac/1  
22> Fac(5).  
120  

Задание 5.1:  
23> Multiply = fun(X, Y) -> X*Y end.  
#Fun<erl_eval.43.65746770>      
24> Multiply(5,7).  
35  

Задания 3.1-5.1 в результате вернули верные, ожидаемые значения, отсюда делаем вывод, что написание и преобразование функций выполненно корректно.  

Задание 5.2:  
25> ToRub = fun({usd, Amount}) when is_integer(Amount), Amount > 0 -> {ok, Amount * 75.5}; ({euro, Amount}) when is_integer(Amount), Amount > 0 -> {ok, Amount * 80}; ({lari, Amount}) when is_integer(Amount), Amount > 0 -> {ok, Amount * 29}; ({peso, Amount}) when is_integer(Amount), Amount > 0 -> {ok, Amount * 3}; ({krone, Amount}) when is_integer(Amount), Amount > 0 -> {ok, Amount * 10}; (Error) -> io:format("Can't convert to rub, error ~p~n", [Error]), {error, badarg} end.  
#Fun<erl_eval.44.65746770>    
26> ToRub({usd, 100}).  
{ok,7550.0}  
27> ToRub({peso, 12}).  
{ok,36}  
28> ToRub({yene, 30}).  
Can't convert to rub, error {yene,30}  
{error,badarg}  
29> ToRub({euro, -15}).  
Can't convert to rub, error {euro,-15}  
{error,badarg}  

В результате выполнения тестовых функций анонимной функции ToRub() были получены выходные данные аналогичные полученным при выполнении функции to_rub() в прошлой домашней работе. Таким образом, преобразование выполнено успешно.

