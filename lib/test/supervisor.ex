require Logger
defmodule Test.Supervisor do
  use Supervisor

  def start_link do
    Logger.debug "Start supervisor."
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    children = [
      worker(Test.TcpAcceptor, []),
    ]
    Logger.debug "supervisor child spec #{inspect children}"
    opts = [strategy: :one_for_one, max_restarts: 3]
    Logger.debug "strategy #{inspect opts}"
    supervise(children, opts)
  end
end
