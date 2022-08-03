defmodule NthPrime do
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise "oh shit"
  def nth(1), do: 2
  def nth(count) do
    pth(count, 3)
  end
  defp pth(1, n), do: n - 2
  defp pth(c, n) do
    if is_prime(n), do: pth(c - 1, n + 2), else: pth(c, n + 2)
  end

  defp is_prime(n) do
    ! Enum.any?(2..ceil(:math.pow(n, 0.5)), fn x -> rem(n, x) == 0 end)
  end
end
NthPrime.nth(1000) |> IO.inspect()
