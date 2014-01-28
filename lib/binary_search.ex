defmodule BinarySearch do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    BinarySearch.Supervisor.start_link
  end

  def sort(list) do
    Enum.sort(list)
  end

  """
    finds the middle of a list
  """
  def middle(min, max) do
    div((min + max), 2)
  end

  """
    when max is less than min we do not have a match
  """
  def find(list, number_to_find, min, max) when max < min do
    {:error, "#{number_to_find} was not found"}
  end

  def find(list, number_to_find, min, max) do
   sorted_list = sort(list)
    if max == 0 do
      max = length(sorted_list) - 1
    end
    mid = middle(min, max)
    cond do
      number_to_find == Enum.at(sorted_list, mid) ->
        {:ok, Enum.at(sorted_list, mid)}
      number_to_find < Enum.at(sorted_list, mid) ->
        find(sorted_list, number_to_find, min, (mid - 1))
      number_to_find > Enum.at(sorted_list, mid) ->
        find(sorted_list, number_to_find, (min + 1), max)
      true ->
        {:ok, Enum.at(sorted_list, mid)}
    end
  end

  
  def find(list, number_to_find, max // 0, min // 0) do
    sorted_list = sort(list)
    if max == 0 do
      max = length(sorted_list) - 1
    end
 
    mid = middle(min, max)
    cond do
      number_to_find == Enum.at(sorted_list, mid) ->
        {:ok, Enum.at(sorted_list, mid)}
      number_to_find < Enum.at(sorted_list, mid) ->
        find(sorted_list, number_to_find, min, (mid - 1))
      number_to_find > Enum.at(sorted_list, mid) ->
        find(sorted_list, number_to_find, (min + 1), max)
      true ->
        {:ok, Enum.at(sorted_list, mid)}
    end
  end
end
