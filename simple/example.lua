function muriel()
  print("first Muriel (lua)")
  coroutine.yield()
  print("second Muriel (lua)")
end

function rhonda()
  print("first Rhonda (lua)")
  coroutine.yield()
  print("second Rhonda (lua)")
end

co_muriel = coroutine.create(muriel)
co_rhonda = coroutine.create(rhonda)

coroutine.resume(co_muriel)
coroutine.resume(co_rhonda)
coroutine.resume(co_muriel)
coroutine.resume(co_rhonda)
