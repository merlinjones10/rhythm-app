import Foundation

enum StemType: String, CaseIterable {
    case up = "-su"
    case dowm = "-sd"
    case upHeadless = "-su-headless"
    case downHeadless = "-sd-headless"
}

enum Direction {
    case left
    case right
    case random
}


let all1bRhythms = Set(["crot", "q-2-joined", "sq-4", "grp-1", "grp-2", "grp-3"])

class MusicalBar {
    var bLength: Int
    var stemType : StemType
    var bar: [String]
    
    static let noteChoices = all1bRhythms
    
    init(bLength: Int, stem: StemType) {
        self.stemType = stem
        self.bLength = bLength
        self.bar = MusicalBar.createBar(length: bLength, stemType: stemType)
    }
    
    class func createBar(length: Int, stemType: StemType) -> [String] {
        var newBar = [String]()
        for _ in 0..<length {
            if let randomRhythm = noteChoices.randomElement() {
                newBar.append("\(randomRhythm)\(stemType.rawValue)")
            }
        }
        return newBar
    }
    
    func rotateBar(_ direction: Direction ) {
        var arrHolder = self.bar
       
        switch direction {
        case .left:
            arrHolder.append(arrHolder[0])
            arrHolder.removeFirst()
            self.bar = arrHolder
        case .right:
            if let lastElement = arrHolder.last {
                arrHolder.insert(lastElement, at: 0)
                arrHolder.removeLast()
                self.bar = arrHolder
            }
            case .random:
            self.bar = MusicalBar.createBar(length: bLength, stemType: stemType)
            while arrHolder == bar {
                bar.shuffle()
            }
        }
    }
}




