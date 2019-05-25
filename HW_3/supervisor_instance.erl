-module(supervisor_instance).
-author("Ido Yehezkel & Ohad Zohar").

%% API
-behavior(supervisor).
-export([start_link/1, init/1]).


start_link(SupervisorName) ->
  supervisor:start_link({local, SupervisorName}, ?MODULE, []).

init([]) ->

  Server1 = {server1, {server_instance, start_link, [server1]},
    permanent, 2000, worker, [server_instance]},
  Server2 = {server2, {server_instance, start_link, [server2]},
    permanent, 2000, worker, [server_instance]},
  Server3 = {server3, {server_instance, start_link, [server3]},
    permanent, 2000, worker, [server_instance]},
  {ok, {{one_for_one, 1, 1000}, [Server1, Server2, Server3]}}.
