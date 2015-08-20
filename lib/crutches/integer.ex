defmodule Crutches.Integer do
  @doc ~S"""
  Check whether `n` is evenly divisible by `divisor`.

  # Examples

      iex> Integer.multiple_of?(7, 3)
      false

      iex> Integer.multiple_of?(10, 2)
      true

      iex> Integer.multiple_of?(14, 7)
      true
  """
  @spec multiple_of?(integer, integer) :: boolean
  def multiple_of?(n, divisor) when is_integer(n), do: rem(n, divisor) == 0

  @doc ~S"""
  Integer.digits copied straight from the Elixir 1.1 standard library, for Elixir < v1.1
  """
  try do
    Elixir.Integer.digits(1140392)
    defdelegate digits(n, base), to: Elixir.Integer
  rescue
    UndefinedFunctionError ->
      def digits(n, base \\ 10) when is_integer(n)    and n >= 0
                                and  is_integer(base) and base >= 2 do
        do_digits(n, base, [])
      end

      defp do_digits(0, _base, []),  do: [0]
      defp do_digits(0, _base, acc), do: acc
      defp do_digits(n, base, acc)  do
        do_digits div(n, base), base, [rem(n, base) | acc]
      end
  end
end
