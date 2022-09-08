//
//  RhythmAppModel.swift
//  RhythmRandom
//
//  Created by Merlin Jones on 08/09/2022.
//

import Foundation


struct RhythmApp {
    private(set) var rhythms: Array<Rhythm>
    private(set) var displayedRhythm: Rhythm
    
    mutating func change() {
        displayedRhythm = rhythms.randomElement()!
    }
    
    init(allRhytyms: Array<String>) {
        let baseValue: Double = 0.125
        rhythms = Array<Rhythm>()
        for index in allRhytyms.indices {
            rhythms.append(Rhythm(name: allRhytyms[index], id: index, value: baseValue * Double(index+1) ))
        }
        displayedRhythm = rhythms.randomElement()!
    }

    struct Rhythm: Identifiable {
        var name: String
        var id: Int = 1
        var value: Double = 0.25
    }
}


// PLAN,
// CLICK BUTTON. CHANGE RHYTHM
//
