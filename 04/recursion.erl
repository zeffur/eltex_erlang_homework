-module(recursion).

-export([tail_fac/1, tail_fac/2]).
-export([duplicate/1, tail_duplicate/1, tail_duplicate/2]).

tail_fac(N) -> tail_fac(N, 1).

tail_fac(N, Acc) when N == 0 -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, Acc*N).

duplicate([]) -> [];
duplicate([Head|[]]) -> [Head, Head];
duplicate([Head|Tail]) -> [Head, Head] ++ duplicate(Tail).

tail_duplicate(List) -> tail_duplicate(List, []).

tail_duplicate([], Acc) -> Acc;
tail_duplicate([Head|[]], Acc) -> lists:reverse([Head, Head] ++ Acc);
tail_duplicate([Head|Tail], Acc) -> tail_duplicate(Tail, [Head, Head] ++ Acc).