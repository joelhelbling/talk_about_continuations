function foo()
	print("first foo")
	coroutine.yield()
	print("second foo")
end

function bar()
	print("first bar")
	coroutine.yield()
	print("second bar")
end

cfoo = coroutine.create(foo)
cbar = coroutine.create(bar)

coroutine.resume(cfoo)
coroutine.resume(cbar)
coroutine.resume(cfoo)
coroutine.resume(cbar)
