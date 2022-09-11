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
        self.bar = createBar(rhythms: rhythms, legnth: barLength)
    }
    // Intents
    mutating func randomizeBar() {
        self.bar = createBar(rhythms: self.rhythms, legnth: 4)
    }
    
    // Data types
    struct Rhythm: Identifiable, Hashable {
        var name: String
        var id: Int
        var value: Double = 0.25
    }
}

// External functions and type declarations
typealias Bar = Array<RhythmApp.Rhythm>

func createBar(rhythms: Bar, legnth: Int) -> Bar {
    var newBar: Bar = []
    for _ in 0..<legnth {
        if var randomElement = rhythms.randomElement() {
            randomElement.id = Int.random(in: 0..<1000)
            newBar.append(randomElement)
        }
    }
    return newBar
}


