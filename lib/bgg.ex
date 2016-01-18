defmodule BGG do
  @moduledoc """
  A BoardGameGeek (http://boardgamegeek.com/xmlapi/) client
  """
  use Application
  use HTTPoison.Base

  def start(_type, _args) do
    BGG.Supervisor.start_link
  end

  def process_url(path) do
    url = "http://boardgamegeek.com/xmlapi/#{path}"
    URI.encode(url)
  end

  def process_response_body(body) do
    body |> Quinn.parse
  end

  def game(id) do
      BGG.Game.game(id) |> BGG.Game.as_BGGGame
  end

  def games(ids) do
      BGG.Game.games(ids) |> BGG.Game.as_BGGGames
  end

  def search(query) do
      BGG.Search.search_games(query) |> BGG.Game.as_BGGGames
  end

end
