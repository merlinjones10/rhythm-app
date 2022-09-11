import Foundation

struct RhythmApp {
    private(set) var rhythms: Array<Rhythm>
    private(set) var bar: Array<Rhythm>
    private(set) var barLength: Int
    
    init(allRhytyms: Array<String>, barLength: Int) {
        let baseValue: Double = 0.125
        rhythms = Array<Rhythm>()
        for index in allRhytyms.indices {
            rhythms.append(Rhythm(name: allRhytyms[index], id: index, value: baseValue * Double(index+1) ))
        }
        self.barLength = barLength
        self.bar = createBar(rhythms: rhythms, length: barLength)
    }
    // Intents
    mutating func randomizeBar() {
        self.bar = createBar(rhythms: self.rhythms, length: 4)
    }
    
    mutating func rotateModelBar(_ direction: Direction) {
        self.bar = rotateBar(self.bar, direction: direction)
        
    }

    // Data types
    struct Rhythm: Identifiable, Hashable {
        var name: String
        var id: Int
        var value: Double = 0.25
    }
    
    enum Direction {
        case left
        case right
        case random
    }
}

// External functions and type declarations
typealias Bar = Array<RhythmApp.Rhythm>

func createBar(rhythms: Bar, length: Int) -> Bar {
    var newBar: Bar = []
    for _ in 0..<length {
        if var randomElement = rhythms.randomElement() {
            randomElement.id = Int.random(in: 0..<1000)
            newBar.append(randomElement)
        }
    }
    return newBar
}


func rotateBar(_ arr: Bar, direction: RhythmApp.Direction) -> Bar{
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


