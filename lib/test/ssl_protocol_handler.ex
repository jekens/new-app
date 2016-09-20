require Logger
defmodule Test.SslProtocolHander do

  def start_link(ref, socket, transport, opts \\ []) do
    :proc_lib.start_link(__MODULE__, :init, [ref, socket, transport, opts])
  end

  def init(ref, socket, transport, opts \\ []) do
    :erlang.process_flag(:trap_exit, true)
    :ok = :proc_lib.init_ack({:ok, self()})
    :ok = :ranch.accept_ack(ref)
    :ok = transport.setopts(socket, [{:active, :once}])
    state = %{
      socket: socket,
      transport: transport
    }
    :gen_server.enter_loop(__MODULE__, [], state)
  end

  def handle_info({:tcp, _socket, data}, %{socket: socket,transport: transport} = state) do
    :ok = transport.setopts(socket, [{:active, :once}])
    # Do something
  end

  def handle_info({:tcp_closed, _socket}, state) do
    Logger.warn "Connection closed by client socket = #{inspect state.socket}."
    {:stop, :normal, state}
  end

  def handle_info(:timeout, state) do
    {:noreply, state}
  end

  def handle_info({:tcp_error, _socket, reason}, state) do
    :ok = state.transport.close(state.socket)
    {:stop, state}
  end

  def handle_info({:'EXIT', pid, reason}, state) do
    {:noreply, state}
  end

  def terminate(reason, state) do
    :ok
  end

  def code_change(_old_vsn, state, _extra) do
    {:ok, state}
  end
end
