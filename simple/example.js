function * laurel() {
  console.log("first Laurel (js)")
  yield
  console.log("second Laurel (js)")
}

function * hardy() {
  console.log("first Hardy (js)")
  yield
  console.log("second Hardy (js)")
}

const itr_laurel = laurel()
const itr_hardy = hardy()

itr_laurel.next()
itr_hardy.next()
itr_laurel.next()
itr_hardy.next()
