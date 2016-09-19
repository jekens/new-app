use Mix.Config
config :gserver, ranch_tcp: [
  {:profile, true},
  {:listener_name, :gserver_tcp_listener},
  {:acceptors, 5},
  {:transport, :ranch_tcp},
  {:transport_options, [port: 8000]}
]
config :gserver, ranch_ssl: [
  {:profile, true},
  {:listener_name, :gserver_ssl_listener},
  {:acceptors, 5},
  {:transport, :ranch_ssl},
  {:transport_options, [port: 4443]}
]
