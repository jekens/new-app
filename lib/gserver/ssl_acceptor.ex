require Logger

defmodule Gserver.SslAcceptor do
  @config Application.get_env(:gserver, :ranch_ssl)
  def start_link do
    Logger.info "start ssl acceptors"

    {:ok, _} = :ranch.start_listener(
      @config[:listener_name],
      @config[:acceptors],
      @config[:transport],
      @config[:transport_options],
      Gserver.SslProtocolHandler,
      []
    )
  end
end
