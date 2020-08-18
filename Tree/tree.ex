defmodule Tree do

def insert(key, val, :nil) do {:leaf, key, val} end
def insert({k2, v2}, {:leaf, k1, v1}) do
  case k2 do
    <= k1 ->
      {:two, k2, {:leaf, k2, v1}, {:leaf, k1, v1}}
    _ ->
    {:two, k1, {:leaf, k1, v1}, {:leaf, k2, v2}}
  end
def insert(k3, v3, {:two, k1, {:leaf, k1, v1}, {:leaf, k2, v2}}) do
  cond do
  k3 <= k1 ->
      {:three, k3, k1, {:leaf, k3, v3}, {:leaf, k1, v2}, {:leaf, k2, v2}}
  k3 <= k2 ->
      {:three, k1, k3, {:leaf, k1, v1}, {:leaf, k3, v3}, {:leaf, k2, v2}}
  true ->
    {:three, k1, k2, {:leaf, k1, v1}, {:leaf, k2, v2}, {:leaf, k3, v3}}
  end
end

end
