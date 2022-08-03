defmodule NthPrime do
  def nth(1), do: 2
  def nth(2), do: 3
  def nth(3), do: 5
  def nth(n) do
    controller = spawn(fn -> controller(n, [5, 3, 2]) end)
    spawn(fn -> worker6(controller, 1, 1) end)
    worker6(controller, 5, 1)
  end

  def controller(n, acc) do
    receive do
      {num, from} ->
        if length(acc) > n do
          IO.inspect(Enum.sort(acc) |> Enum.at(n - 1))
          IO.inspect(acc)
          send(from, :stop)
        else
          send(from, :continue)
          if Enum.any?(acc, fn x -> rem(num, x) == 0 end) do
            controller(n, acc)
          else
            controller(n, [num | acc])
          end
        end
    end
  end

  def worker6(controller, add_num, counter) do
    send(controller, {6 * counter + add_num, self()})
    receive do
      :stop ->
        System.halt(0)
      :continue ->
        worker6(controller, add_num, counter + 1)
    end
  end
end

NthPrime.nth(1000)
