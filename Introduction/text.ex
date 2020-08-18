defmodule Test do

def double(n) do 2*n end  # return double of the argument

def ftoc (f) do c = (f-32)/1.8 end # from fahrenheit to celsius

def arearec(a, b) do area = a*b end # area of a rectangle given the two sides

def areasq (a) do arearec(a, a) end # area of a square using the previous func

def areacirc(r) do areasq(r)*3.14 end # area of a circle given radius r

def product(m, n) do
  if(m == 0 || n == 0) do # the product of m and n is 0 if m or n is equal to 0
    0
  else
    n + product((m-1), n) # the product is n plus the product of (m-1) and n
  end
end

def product_cond(m, n) do
  cond do
    m == 0 ->
      0
    true ->
      n + product_cond((m-1), n)
  end
end

def product_clauses(0, _) do 0 end
def product_clauses(m, n) do n + product_clauses((m-1), n) end

def exp_clauses(x, 0) do 1 end
def exp_clauses(x, n) do
  case rem(n,2) do
        0 ->
          exp1 = div(n,2)
          exp2 = exp_clauses(x,exp1)
          exp2*exp2
        1 ->
          exp1 = (n-1)
          exp2 = exp_clauses(x,exp1)
          exp2*x
        end
end

# return the nth element in a list
def return_nth(n, []) do IO.puts("The list is empty/index exceeds list length") end
def return_nth(n, [head | tail]) do
  case n do
    1 ->
      head
    _ ->
      return_nth((n-1), tail)
  end
end

# return the length of a list
def len([]) do 0 end
def len([_ | tail]) do 1+len(tail) end

# return the sum of all elements in a list (assume all elements are ints)
def sum([]) do 0 end
def sum([head | tail]) do head + sum(tail) end

# duplicate all elements in a list
def duplicate([]) do [] end # [list | []]
def duplicate([head | tail]) do [head*2 | duplicate(tail)] end

# add x to a list
def add(x, []) do [x] end
def add(x, [head | tail]) do
  case x in [head | tail] do
    true ->
      IO.puts("The element is already in the list")
    false ->
      [head | add(x, tail)]
  end

end

# remove all occurences of x in a list
def remove(_, []) do [] end
def remove(x, [x | tail]) do remove(x, tail) end
def remove(x, [head | tail]) do [head | remove(x, tail)] end

# return a list of unique elements in a list
def unique([]) do [] end
def unique([x | tail]) do [x | unique(remove(x, tail))] end

# reverse a list
def reversed(l) do reversed(l, []) end
def reversed([], r) do r end
def reversed([head | tail], r) do reversed(tail, [head | r]) end

# inserts element in the right place in a list
def insert(x, []) do [x] end
def insert(e, [head | tail]) when e > head do
    [head | insert(e, tail)]
  end
def insert(e, listwithlarger) do
  [e | listwithlarger]
end

# insertion sort
def isort(l) do isort(l, []) end
def isort([], s) do s end
def isort([head | tail], s) do isort(tail, insert(head, s)) end

def isort2(l) do isort(l, []) end
def isort2(l, sorted) do
  case l do
    [] ->
      sorted
    [h | t] ->
      isort2(t, insert(h, sorted))
end
end

# Mergesort
def msort([]) do [] end
def msort([x]) do [x] end
def msort(list) do
  {l1, l2} = msplit(list, [], [])
  merge(msort(l1), msort(l2)) # gör till fler små listor
end

def msplit([], l1, l2) do {l1, l2} end
def msplit([head | tail], l1, l2) do
  msplit(tail, [head | l2], l1) # lägger in element i olika mindre listor
end

def merge([], l2) do l2 end
def merge(l1, []) do l1 end
def merge(l1 = [h1 | t1], l2 = [h2 | t2]) do
  cond do
    h1 < h2 -> [h1 | merge(t1, l2)]
    true -> [h2 | merge(t2, l1)]
  end
end

# Quicksort
def qsort([]) do [] end
def qsort([p | l]) do
  {l1, l2} = qsplit(p, l, [], [])
  small = qsort(l1)
  large = qsort(l2)
  append(small, [p | large])
end
def qsplit(_, [], small, large) do {small, large} end
def qsplit(p, [head | tail], small, large) do
  if head < p do
    qsplit(p, tail, [head | small], large)
  else
    qsplit(p, tail, small, [head | large])
  end
end
def append([], l2) do l2 end
def append([head | tail], l2) do [head | append(tail, l2)] end

# to binary
def binary(n) do new(n, []) end
def new(0,list) do list end # if div = 0,
def new(n, list) do
  new(div(n,2), [rem(n,2) | list])
end

end
