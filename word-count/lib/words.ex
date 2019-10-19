defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence, " ")
    |> counter(%{})
  end

  def counter([], countMap), do: countMap

  def counter([first | rest], countMap) do
    countMap =
      case countMap[first] do
        nil -> Map.put_new(countMap, first, 1)
        _ -> Map.put(countMap, first, countMap[first] + 1)
      end

    counter(rest, countMap)
  end
end
