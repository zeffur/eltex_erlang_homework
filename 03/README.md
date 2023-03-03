Задание 1:  
1> c("converter.erl").  
{ok,converter}  
2> converter:to_rub({usd, 100}).  
Convert usd to rub, amount 100  
{ok,7550.0}  
3> converter:to_rub({peso, 12}).  
Convert peso to rub, amount 12  
{ok,36}  
4> converter:to_rub({yene, 30}).  
Can't convert to rub, error {yene,30}  
{error,badarg}  
5> converter:to_rub({euro, -15}).  
Can't convert to rub, error {euro,-15}  
{error,badarg}  

Задание 2:  
6> c("converter.erl").  
{ok,converter}  
7> converter:to_rub2({usd, 100}).  
Convert usd to rub, amount 100, Result {ok,7550.0}  
{ok,7550.0}  
8> converter:to_rub2({peso, 12}).  
Convert peso to rub, amount 12, Result {ok,36}  
{ok,36}  
9> converter:to_rub2({yene, 30}).  
Can't convert to rub, error {yene,30}  
Convert yene to rub, amount 30, Result {error,badarg}  
{error,badarg}  
10> converter:to_rub2({euro, -15}).  
Can't convert to rub, error {euro,-15}  
Convert euro to rub, amount -15, Result {error,badarg}  
{error,badarg}  
11> converter:to_rub3({usd, 100}).  
Convert usd to rub, amount 100  
{ok,7550.0}  
12> converter:to_rub3({peso, 12}).  
Convert peso to rub, amount 12  
{ok,36}  
13> converter:to_rub3({yene, 30}).  
Can't convert to rub, error {yene,30}  
{error,badarg}  
14> converter:to_rub3({euro, -15}).  
Can't convert to rub, error {euro,-15}  
{error,badarg}  

В результате проделанной работы тремя разными способами была реализована функция, конвертирующая сумму пяти видов валют в рубли. 
Результаты компиляции модуля и отработки кода на четырех примерах представлены выше. 
Вызов функции завершился ошибкой в двух случаях:
в примере "converter:to_rub({yene, 30})." указан не обрабатываемый кодом тип валюты;
в то время как вариант "converter:to_rub({euro, -15})." имеет описанную валюту, но его сумма не проходит проверку на положительное число.
Так как все функции в основе имеют одинаковую логику, их результат также одинаков.

[ДР-03] Захарова Анастасия

