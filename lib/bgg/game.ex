defmodule BGG.Game do
  @moduledoc """
  Game resources
  """

  defstruct [
      :age,
      :description,
      :maxplayers,
      :maxplaytime,
      :minplayers,
      :minplaytime,
      :name,
      :objectid,
      :rank,
      :thumbnail,
      :yearpublished
  ]

  def games(ids) do
    objectids = Enum.join(ids, ",")
    response = BGG.get!("boardgame/#{objectids}?stats=1")
    Quinn.find(response.body, :boardgame)
  end

  def game(objectid) do
    Enum.at(games([objectid]), 0)
  end

  def as_BGGGames(games) do
    Enum.map(games,
      fn(i) ->
        as_BGGGame(i)
      end
    )
  end

  def as_BGGGame(game) do
    %BGG.Game{
      objectid: elem(Enum.at(game.attr, 0), 1),
      name: name(game),
      yearpublished: simple_value(game, :yearpublished),
      thumbnail: "http:#{simple_value(game, :thumbnail)}",
      description: simple_value(game, :description),
      maxplayers: simple_value(game, :maxplayers),
      minplayers: simple_value(game, :minplayers),
      age: simple_value(game, :age),
      maxplaytime: simple_value(game, :maxplaytime),
      minplaytime: simple_value(game, :minplaytime),
      rank: rank(game)
    }
  end

  def simple_value(item, value) do
    Enum.at(simple_values(item, value), 0)
  end

  def simple_values(item, value) do
    Enum.at(Quinn.find(item, value), 0).value
  end

  def name(item) do
    predicate = fn(x) -> x.attr[:primary] == "true" end
    Quinn.find(item, :name) |>
    Enum.filter(predicate) |>
    simple_value(:name)
  end

  def rank(item) do
    predicate = fn(x) -> x.attr[:name] == "boardgame" end
    e = Quinn.find(item, :rank) |>
    Enum.filter(predicate) |>
    Enum.at(0)
    e.attr[:rank]
  end

end
