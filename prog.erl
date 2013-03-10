-module (prog).
-export ([main/0]).
 
main() ->
    Ret = logfib(100000),
    io:format("~p~n", [Ret]).
 
logfib(0) -> 0;
logfib(1) -> 1;
logfib(2) -> 1;
logfib(N) ->
    Memo = get(N),
        if 
                Memo == undefined ->
                        Res1 = logfib(N div 2 + 1),
                        Res2 = logfib(N div 2),
        
                        if
                                N rem 2 =:= 0 ->
                                        Res = Res2 * (Res1 + Res1 - Res2);
                                true ->
                                        Res = Res1 * Res1 + Res2 * Res2
                        end,
                        put(N, Res),
                        Res;
                true ->
                        Memo
        end.
 
