import Foundation

struct RhythmApp {
    private(set) var barLength = 4
    private(set) var firstBar: MusicalBar
    
    init() {
        firstBar = MusicalBar(bLength: barLength, stem: .up)
    }
    
    // Intents
    mutating func changeBar(_ direction: Direction) {
        firstBar.rotateBar(direction)
    }
    

    // Data types
    struct Rhythm: Identifiable, Hashable {
        var name: String
        var id: Int
        var value: Double = 1.0
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



