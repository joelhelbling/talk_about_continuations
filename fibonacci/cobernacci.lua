function fibFunc()
  n1 = 0
  n2 = 1
  while true do
    n3 = n1 + n2
    coroutine.yield(n3)
    n1 = n2
    n2 = n3
  end
end

fib = coroutine.create(fibFunc)

for _ = 0, 9 do
  errfree, value = coroutine.resume(fib)
  print(value)
end
