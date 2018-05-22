function * foo() {
  console.log("first foo")
  yield
  console.log("second foo")
}

function * bar() {
  console.log("first bar")
  yield
  console.log("second bar")
}

const ifoo = foo()
const ibar = bar()

ifoo.next()
ibar.next()
ifoo.next()
ibar.next()
