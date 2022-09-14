//
//  RhythmDB.swift
//  RhythmRandom
//
//  Created by Merlin Jones on 14/09/2022.
//

import Foundation

struct Stave {
    var rhythms: [RhythmApp.Rhythm]
    var position: Int
    let id: Int
}

//
//let crotChoices: Set = ["crot-sd", "crot-su", "crot-sd-headless", "crot-su-headless"]
//let qCHoices: Set = ["q-2-sd-headless", "q-2-su-headless", "q-2-joined-sd", "q-2-joined-su"]
//let sqChoices: Set = ["sq-4-sd-headless", "sq-4-su-headless", "sq-4-sd", "sq-4-su"]
//let grp1Choices: Set = ["grp-1-sd","grp-1-su","grp-1-sd-headless","grp-1-sd-headless"]
//let grp2Choices: Set = ["grp-2-sd","grp-2-su","grp-2-sd-headless","grp-2-sd-headless"]
//let grp3Choices: Set = ["grp-3-sd","grp-3-su","grp-3-sd-headless","grp-3-sd-headless"]
//
//let stemDirection = "sd"
//let headless = "-headless"
//
//
//let generic: Set = ["crot-\(stemDirection)\(headless)"]

enum StemDirection: String, CaseIterable {
    case up = "-su"
    case dowm = "-sd"
    case upHeadless = "-su-headless"
    case downHeadless = "-sd-headless"
}


func createRhythmSet(stem: StemDirection) -> [String] {
    let availableRhythms = ["crot", "q-2", "sq-4", "grp-1", "grp-2", "grp-3"]
    var rhytymSet = [String]()
    for rhythm in availableRhythms {
        rhytymSet.append("\(rhythm)\(stem.rawValue)")
    }
    return rhytymSet
}

