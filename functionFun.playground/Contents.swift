import Cocoa

struct Rhythm {
var name: String
var value: Double
var rest: Bool = false
}

let base = 1
let minim = Rhythm(name: "minim", value: 2.0)
let crotchet = Rhythm(name: "crotchet", value: 1.0)
let dottedCrotchet = Rhythm(name: "dottedCrotchet", value: 1.5)
let quaver = Rhythm(name: "quaver", value: 0.5)
let quaverPair = Rhythm(name: "quaverPair", value: 1.0)
let semiQuaver = Rhythm(name: "semiQuaver", value: 0.25)

var barLength = 4.0
let availableNotes: Array<Rhythm> = [crotchet, quaver, quaverPair, semiQuaver, dottedCrotchet, minim]

//
//func createBar(choices: Array<Rhythm>, length: Double) -> Array<Rhythm>  {
//    // Error handling.
//    var bar: Array<Rhythm> = []
//    var amountLeftInBar = length
//    var totalCurrentBarLength = 0.0
//    var availableChoices = choices
//
//    while (totalCurrentBarLength < length) {
//        amountLeftInBar = length - totalCurrentBarLength
//        availableChoices = choices.filter { rhythm in
//            return rhythm.value <= amountLeftInBar
//        }
//        if let randomChoice = availableChoices.randomElement() {
//            bar.append(randomChoice)
//            totalCurrentBarLength += randomChoice.value
//        } else {
//            print("No choices left")
//            break
//        }
//    }
//    return bar
//}
//
//
//let myBar = createBar(choices: availableNotes, length: 4.0)
//
//var total = 0.0
//
//for val in myBar {
//    print(val.name)
//    total += val.value
//
//}
//print("\nTOTAL: \(total)")

let myArr = [1,2,3,4,5]

enum Direction {
    case left
    case right
    case random
}

func rotateBar(_ arr: [Int], direction: Direction) -> Array<Int>{
    var newArr = arr
    if arr.isEmpty {return arr}
    
    if let lastElement = arr.last {
        switch direction {
        case .left:
            newArr.append(arr[0])
            newArr.removeFirst()
        case .right:
            newArr.insert(lastElement, at: 0)
            newArr.removeLast()
        case .random:
            newArr.shuffle()
        }
    } else {
        return newArr
    }
    return newArr
}

let newArr = rotateBar([1,2,3], direction: Direction.right)

print(newArr)

// 123
// 231 - L
//312

//func createBar(choices: Array<Rhythm>, length: Double) {
//    // <- choice of values
//    // set a running total
//    var totalCurrentBarLength = 0.0
//    // init an empty array
//    var bar: Array<Rhythm> = []
//    // init a VAR: available values, which is length - runnningTotal
//    var amountLeftInBar = length
//    // filter choices to only have vals which are <= availableChoices i.e how much time left
//
//    // (if only 0.5 beats left then filter for RHYTHMS whose value is <= 0.5 )
//    // while total < length
//    // append a Random rhythm to the array
//    // array must exact= length
//
//
//    // -> an array of rhythms whos total values = <length>
//}
