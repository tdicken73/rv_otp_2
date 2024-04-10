```elixir
iex(1)> clear

iex(2)> cell = Enum.random([true, false])
false
iex(3)> cell = Enum.random([true, false])
false
iex(4)> cell = Enum.random([true, false])
true
iex(5)> width = 5
5
iex(6)> height = 5
5
iex(7)> for row <- 1..width, col <- 1..height, into: %{}, do: {{row, col}, Enum.random([true, false])}
%{
  {1, 1} => true,
  {1, 2} => false,
  {1, 3} => true,
  {1, 4} => false,
  {1, 5} => false,
  {2, 1} => true,
  {2, 2} => false,
  {2, 3} => false,
  {2, 4} => false,
  {2, 5} => true,
  {3, 1} => false,
  {3, 2} => true,
  {3, 3} => false,
  {3, 4} => true,
  {3, 5} => true,
  {4, 1} => true,
  {4, 2} => true,
  {4, 3} => true,
  {4, 4} => true,
  {4, 5} => true,
  {5, 1} => false,
  {5, 2} => false,
  {5, 3} => true,
  {5, 4} => true,
  {5, 5} => false
}
iex(8)> 1..width
1..5
iex(9)> i
Term
  1..5
Data type
  Range
Description
  This is a struct representing a range of numbers. It is commonly
  defined using the `first..last//step` syntax. The step is not
  required and defaults to 1.
Raw representation
  %Range{first: 1, last: 5, step: 1}
Reference modules
  Range
Implemented protocols
  Enumerable, IEx.Info, Inspect
iex(10)> board = v 7
%{
  {1, 1} => true,
  {1, 2} => false,
  {1, 3} => true,
  {1, 4} => false,
  {1, 5} => false,
  {2, 1} => true,
  {2, 2} => false,
  {2, 3} => false,
  {2, 4} => false,
  {2, 5} => true,
  {3, 1} => false,
  {3, 2} => true,
  {3, 3} => false,
  {3, 4} => true,
  {3, 5} => true,
  {4, 1} => true,
  {4, 2} => true,
  {4, 3} => true,
  {4, 4} => true,
  {4, 5} => true,
  {5, 1} => false,
  {5, 2} => false,
  {5, 3} => true,
  {5, 4} => true,
  {5, 5} => false
}
iex(11)> location = {4, 3}
{4, 3}
iex(12)> {rr, cc} = location
{4, 3}
iex(13)> rr
4
iex(14)> cc
3
iex(15)> for r <- (rr - 1)..(rr + 1), c <- (cc - 1, cc + 1), {r, c} != {rr, cc}, do: Map.get(board, {r, c}, false)
** (SyntaxError) iex:15:50: syntax error before: ')'
    |
 15 | for r <- (rr - 1)..(rr + 1), c <- (cc - 1, cc + 1), {r, c} != {rr, cc}, do: Map.get(board, {r, c}, false)
    |                                                  ^
    (iex 1.15.4) lib/iex/evaluator.ex:294: IEx.Evaluator.parse_eval_inspect/4
    (iex 1.15.4) lib/iex/evaluator.ex:187: IEx.Evaluator.loop/1
    (iex 1.15.4) lib/iex/evaluator.ex:32: IEx.Evaluator.init/5
    (stdlib 5.0.2) proc_lib.erl:241: :proc_lib.init_p_do_apply/3
iex(15)> for r <- (rr - 1)..(rr + 1), c <- (cc - 1)..(cc + 1), {r, c} != {rr, cc}, do: Map.get(board, {r, c}, false)
[true, false, true, true, true, false, true, true]
iex(16)> neighbor_count = Enum.count(v 15)
8
iex(17)> neighbor_count = Enum.count(v(15), fn cell -> cell end)    
6
iex(18)> 

```
