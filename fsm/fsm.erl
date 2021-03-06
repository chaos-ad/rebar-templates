-module({{name}}).
-behaviour(gen_fsm).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% gen_fsm callbacks:
-export([init/1, handle_info/3, handle_event/3, handle_sync_event/4, terminate/3, code_change/4]).

%% api:
-export([start_link/0]).
-export([state_name/2, state_name/3]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-record(state, {}).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start_link() ->
    gen_fsm:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    lager:debug("~p: started as ~p", [?MODULE, self()]),
    {ok, state_name, #state{}}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

state_name(_Event, State) ->
    lager:warning("~p: unhandled event: ~p", [?MODULE, _Event]),
    {next_state, state_name, State}.

state_name(_Event, _, State) ->
    lager:warning("~p: unhandled sync event: ~p", [?MODULE, _Event]),
    {reply, ok, state_name, State}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

handle_event(_Event, StateName, State) ->
    lager:warning("~p: unhandled event for all states: ~p", [?MODULE, _Event]),
    {next_state, StateName, State}.

handle_sync_event(_Event, _, StateName, State) ->
    lager:warning("~p: unhandled sync event for all states: ~p", [?MODULE, _Event]),
    {next_state, StateName, State}.

handle_info(_Info, StateName, State) ->
    lager:warning("~p: unhandled info: ~p", [?MODULE, _Info]),
    {next_state, StateName, State}.

terminate(_Reason, _, _) ->
    lager:debug("~p: terminated with reason ~p", [?MODULE, _Reason]).


code_change(_, StateName, State, _) ->
    {ok, StateName, State}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Internal functions:
