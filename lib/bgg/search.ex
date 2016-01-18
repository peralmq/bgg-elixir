defmodule BGG.Search do
  @moduledoc """
  Search resources
  """

  def search_games(query, limit \\ 10) do
    items = search(query)
    objectids = for i <- items, do: elem(Enum.at(i.attr, 0), 1)
    top_objectids = Enum.slice(Enum.uniq(objectids), 0, limit)
    BGG.Game.games(top_objectids)
  end

  def search(query) do
    response = BGG.get!("search?search=#{query}")
    Quinn.find(response.body, :boardgame)
  end

end
