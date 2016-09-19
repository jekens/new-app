require Logger

defmodule Gserver.TcpAcceptor do
  @config Application.get_env(:gserver, :ranch_tcp)
  def start_link do
    Logger.info "start tcp acceptors"

    {:ok, _} = :ranch.start_listener(
      @config[:listener_name],
      @config[:acceptors],
      @config[:transport],
      @config[:transport_options],
      Gserver.TcpProtocolHandler,
      []
    )
  end
end
