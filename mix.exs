defmodule PlugGuard.Mixfile do
  use Mix.Project

  @version "0.0.1"
  @github_url "https://github.com/foxzool/plug_guard"
  @description """
  A plug server for oauth2
  """

  def project do
    [
      app: :plug_guard,
      version: @version,
      elixir: "~> 1.0",
      name: "PlugGuard",
      source_url: @github_url,
      description: @description,
      deps: deps,
      package: package,
      docs: [readme: "README.md", main: "README"]
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :cowboy, :plug]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 0.11.0"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.6", only: :dev},
    ]
  end

  defp package do
    [
      contributors: ["Fox ZoOL"],
      licenses: ["MIT"],
      links: %{"GitHub" => @github_url}
    ]
  end
end
