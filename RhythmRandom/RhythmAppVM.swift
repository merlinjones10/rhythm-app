//
//  RhythmVM.swift
//  RhythmRandom
//
//  Created by Merlin Jones on 08/09/2022.
//

import Foundation
import SwiftUI


class RhythmRandomizerVM: ObservableObject {
    
    static let rhythmChoice = ["Crotchet","quavers-2-joined","semiquavers-4-joined", "Group 1" , "Group 2", "Group 3"]

    static func createRhythmApp() -> RhythmApp { RhythmApp(allRhytyms: rhythmChoice, barLength: 4) }
    
    @Published private var model: RhythmApp = createRhythmApp()
    
    var rhythms: Array<RhythmApp.Rhythm> {
        model.rhythms
    }
    
    var bar: Bar {
    model.bar
    }
    
    func randomizeRhythms() {
        model.randomizeBar()
    }
}

