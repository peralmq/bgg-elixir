defmodule BGGTest do

  use ExUnit.Case

  test "the truth" do
    assert(true)
  end

  test "game returns a game" do
    game = BGG.Game.game("2651")
    bgg_game = BGG.Game.as_BGGGame(game)
    assert bgg_game.name == "Power Grid"
  end

  test "search_games returns games" do
    games = BGG.Search.search_games("Power Grid")
    bgg_games = BGG.Game.as_BGGGames(games)
    assert Enum.any?(
      bgg_games,
      fn(g) ->
        g.objectid == "2651"
      end
    )
  end

end
