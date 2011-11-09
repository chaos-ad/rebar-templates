#!/usr/bin/env escript
%% -*- erlang -*-
%%! -sname {{name}}adm@`hostname` -cookie {{name}}_cookie

main(_) ->
    Host = list_to_atom("{{name}}srv@" ++ net_adm:localhost()),
    io:format("Stopping daemon: "),
    Res = rpc:call(Host, init, stop, []),
    io:format("~p~n", [Res]).


