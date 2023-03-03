-module(converter).

-export([to_rub/1, to_rub2/1, to_rub3/1]).

to_rub({usd, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [usd, Amount]),
  {ok, Amount * 75.5};
to_rub({euro, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [euro, Amount]),
  {ok, Amount * 80};
to_rub({lari, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [lari, Amount]),
  {ok, Amount * 29};
to_rub({peso, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [peso, Amount]),
  {ok, Amount * 3};
to_rub({krone, Amount}) when is_integer(Amount), Amount > 0 ->
  io:format("Convert ~p to rub, amount ~p~n", [krone, Amount]),
  {ok, Amount * 10};
to_rub(Error) ->
  io:format("Can't convert to rub, error ~p~n", [Error]),
  {error, badarg}.

to_rub2(Arg) ->
  Result =
    case Arg of
      {usd, Amount} when is_integer(Amount), Amount > 0 ->
        {ok, Amount * 75.5};
      {euro, Amount} when is_integer(Amount), Amount > 0 ->
        {ok, Amount * 80};
      {lari, Amount} when is_integer(Amount), Amount > 0 ->
        {ok, Amount * 29};
      {peso, Amount} when is_integer(Amount), Amount > 0 ->
        {ok, Amount * 3};
      {krone, Amount} when is_integer(Amount), Amount > 0 ->
        {ok, Amount * 10};
      Error ->
        io:format("Can't convert to rub, error ~p~n", [Error]),
        {error, badarg}
    end,
  io:format("Convert ~p to rub, amount ~p, Result ~p~n", tuple_to_list(Arg) ++ [Result]),
  Result.

to_rub3(Arg) ->
  case Arg of
    {usd, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [usd, Amount]),
      {ok, Amount * 75.5};
    {euro, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [euro, Amount]),
      {ok, Amount * 80};
    {lari, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [lari, Amount]),
      {ok, Amount * 29};
    {peso, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [peso, Amount]),
      {ok, Amount * 3};
    {krone, Amount} when is_integer(Amount), Amount > 0 ->
      io:format("Convert ~p to rub, amount ~p~n", [krone, Amount]),
      {ok, Amount * 10};
    Error ->
      io:format("Can't convert to rub, error ~p~n", [Error]),
      {error, badarg}
  end.