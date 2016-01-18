# BoardGameGeek [![Hex.pm](https://img.shields.io/hexpm/v/bgg.svg)](https://hex.pm/packages/bgg) [![Docs](https://img.shields.io/badge/docs-latest-brightgreen.svg?style=flat)](http://hexdocs.pm/bgg/0.1.0/)

A BoardGameGeek API wrapper in Elixir

## Installation

Add `bgg` to your dependencies in your `mix.exs`.

```Elixir
defp deps do
  [...
   {:bgg, "~> 0.1"}]
end
```

## Usage

```elixir
iex(1)> BGG.game("2651")
%BGG.Game{age: "12",
 description: "Power Grid is the updated release of the Friedemann Friese crayon game Funkenschlag. It removes the crayon aspect from network building in the original edition, while retaining the fluctuating commodities market like Crude: The Oil Game and an auction round intensity reminiscent of The Princes of Florence.<br/><br/>The objective of Power Grid is to supply the most cities with power when someone's network gains a predetermined size.  In this new edition, players mark pre-existing routes between cities for connection, and then bid against each other to purchase the power plants that they use to power their cities.<br/><br/>However, as plants are purchased, newer, more efficient plants become available, so by merely purchasing, you're potentially allowing others access to superior equipment.<br/><br/>Additionally, players must acquire the raw materials (coal, oil, garbage, and uranium) needed to power said plants (except for the 'renewable' windfarm/ solar plants, which require no fuel), making it a constant struggle to upgrade your plants for maximum efficiency while still retaining enough wealth to quickly expand your network to get the cheapest routes.<br/><br/>",
 maxplayers: "6", maxplaytime: "120", minplayers: "2", minplaytime: "120",
 name: "Power Grid", objectid: "2651", rank: nil,
 thumbnail: "http://cf.geekdo-images.com/images/pic173153_t.jpg",
 yearpublished: "2004"}

iex> BGG.search("Power Grid")
...

iex> BGG.games("2651", "2348")
...

```

## Develop
```
mix test
```

## Reference

See [BoardGameGeek's API docs](http://boardgamegeek.com/xmlapi/).

## Dependencies

- [HTTPoison](https://github.com/edgurgel/httpoison)
- [Quinn](https://github.com/nhu313/Quinn)
