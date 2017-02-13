%%%-------------------------------------------------------------------
%%% @author arnauld_loyer
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. févr. 2017 18:02
%%%-------------------------------------------------------------------
-module(usecase).
-author("arnauld_loyer").

%% API
-export([sc/0]).
-export([subscribe/1]).

sc() ->
  {ok, C} = eredis:start_link(),
  {ok, CFG} = eredis:q(C, ["config", "set", "notify-keyspace-events", "KEA"]),
  io:format("CFG: ~p~n", [CFG]),
  {ok, <<"OK">>} = eredis:q(C, ["SET", "foo", "bar"]),
  {ok, <<"1">>} = eredis:q(C, ["EXPIRE", "foo", 10]),
  {ok, Sub} = eredis_sub:start_link(),
  Receiver = spawn_link(?MODULE, subscribe, [Sub]),
  ttl(C).

subscribe(Sub) ->
  eredis_sub:controlling_process(Sub),
  eredis_sub:psubscribe(Sub, [<<"__key*__:*">>]),
  loop(Sub).

loop(Sub) ->
  receive
    Msg ->
      io:format(">> ~p~n", [Msg]),
      eredis_sub:ack_message(Sub),
      loop(Sub)
  end.

ttl(C) ->
  case eredis:q(C, ["TTL", "foo"]) of
    {ok, <<"-2">>} ->
      io:format(">> Expired!!~n", []);

    Rep ->
      io:format(">> ~p~n", [Rep]),
      timer:sleep(1000),
      ttl(C)
  end.