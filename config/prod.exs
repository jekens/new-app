use Mix.Config
config :test, ranch_tcp: [
  {:profile, true},
  {:listener_name, :test_tcp_listener},
  {:acceptors, 5},
  {:transport, :ranch_tcp},
  {:transport_options, [port: 8000]}
]
config :test, ranch_ssl: [
  {:profile, true},
  {:listener_name, :test_ssl_listener},
  {:acceptors, 5},
  {:transport, :ranch_ssl},
  {:transport_options, [port: 4443]}
]
