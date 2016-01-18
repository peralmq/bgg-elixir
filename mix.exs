defmodule BGG.Mixfile do
  use Mix.Project

  def project do
    [ app: :bgg,
      version: "0.1.0",
      elixir: "~> 1.0",
      description: description,
      package: package,
      deps: deps ]
  end

  def application do
    [ mod: { BGG, [] },
      applications: [:httpoison] ]
  end

  defp deps do
    [
      { :httpoison, "~> 0.8.0" },
      { :quinn, "~> 0.0.4" },
      { :ex_doc, "~> 0.6.1", only: :dev },
      { :earmark, "~> 0.1.12", only: :dev }
    ]
  end

  defp description do
    """
    A BoardGameGeek API wrapper in Elixir
    http://boardgamegeek.com/xmlapi/
    """
  end

  defp package do
    [ files: [ "lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: [ "Pelle Almquist" ],
      licenses: [ "MIT" ],
      links: %{ "GitHub" => "https://github.com/peralmq/bgg-elixir" } ]
  end
end
