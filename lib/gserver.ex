require Logger
defmodule Gserver do
  use Application
  def start(_type, _args) do
    Logger.debug "Start application."
    Gserver.SupervisorEmbed.start_link
  end
end
