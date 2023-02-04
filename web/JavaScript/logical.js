!!10 // true
!!0 // false
!!'abc' // true
!!'' // false
!!undefined // false
!!{} // true (!)

/*
Short circuled
*/

undefined && true // undefined
'' && false // ''
false && true // false
true && 'abc' // 'abc'
'abc' && true // true

'abc' || true // 'abc'
'' || 'default value' // 'default value'
/* 
Conditioned function without if else.
*/
let b = 10
b && console.log('Executed!') // undefined
let c
c && console.log('Executed!') // undefined

// ... 
const button = {
    with: 200,
    text: 'sell'
}

const redButton = {
    ...button,
    color: 'red'
}

console.table(redButton)
