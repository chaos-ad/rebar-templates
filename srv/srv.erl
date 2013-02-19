-module({{name}}).
-behaviour(gen_server).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% gen_server callbacks:
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%% api:
-export([start_link/0]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-record(state, {}).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init([]) ->
    lager:debug("{{name}} started: ~p", [self()]),
    {ok, #state{}}.

handle_call(_Call, _, State) ->
    lager:warning("Unhandled call: ~p", [_Call]),
    {reply, ok, State}.

handle_cast(_Cast, State) ->
    lager:warning("Unhandled cast: ~p", [_Cast]),
    {noreply, State}.

handle_info(_Info, State) ->
    lager:warning("Unhandled info: ~p", [_Info]),
    {noreply, State}.

terminate(_Reason, _) ->
    lager:debug("{{name}} terminated: ~p", [_Reason]).

code_change(_, State, _) ->
    {ok, State}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
