//
//  RhythmVM.swift
//  RhythmRandom
//
//  Created by Merlin Jones on 08/09/2022.
//

import Foundation
import SwiftUI


class RhythmRandomizerVM: ObservableObject {
    
    static let rhythmChoice = ["Quaver single","Crotchet", "Minim"]
    
    static func createRhythmApp() -> RhythmApp {
        RhythmApp(allRhytyms: rhythmChoice)
    }
    
    @Published private var model: RhythmApp = createRhythmApp()
    
    var rhythms: Array<RhythmApp.Rhythm> {
        model.rhythms
    }
    
    var onlyRiddim: RhythmApp.Rhythm {
        model.displayedRhythm
    }
    
    func randomize() {
        model.change()
    }
}

