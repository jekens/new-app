defmodule Test.Mixfile do
  use Mix.Project

  def project do
    [app: :test,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    dev_packages = Mix.env == :dev && [:exsync] || []
    [applications: [:logger] ++ dev_packages]
  end

  defp deps do
    [
      {:ranch, "~> 1.0"},
      {:exsync, "~> 0.1.2", only: [:dev]}
    ]
  end
end
