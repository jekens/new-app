require Logger

defmodule Test.TcpAcceptor do
  @config Application.get_env(:test, :ranch_tcp)
  def start_link do
    Logger.info "start tcp acceptors"

    {:ok, _} = :ranch.start_listener(
      @config[:listener_name],
      @config[:acceptors],
      @config[:transport],
      @config[:transport_options],
      Test.TcpProtocolHandler,
      []
    )
  end
end
