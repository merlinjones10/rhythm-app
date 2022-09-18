import Foundation

struct RhythmApp {
    private(set) var barLength = 4
    private(set) var firstBar: MusicalBar
    private(set) var all4Bars: [MusicalBar]
    
    
    init() {
        firstBar = MusicalBar(bLength: barLength, stem: .up)
        all4Bars = [MusicalBar]()

        for stem in StemType.allCases {
            all4Bars.append(MusicalBar(bLength: 4, stem: stem))
        }
    }
    
    // Intents
    mutating func changeBar(_ direction: Direction) {
        firstBar.rotateBar(direction)
    }
    
}






