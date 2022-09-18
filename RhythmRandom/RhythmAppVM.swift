//
//  RhythmVM.swift
//  RhythmRandom
//
//  Created by Merlin Jones on 08/09/2022.
//

import Foundation
import SwiftUI


class RhythmRandomizerVM: ObservableObject {
    
    static func createRhythmApp() -> RhythmApp { RhythmApp() }
    
    @Published private var model: RhythmApp = createRhythmApp()
    
    var bar1: MusicalBar{
        model.firstBar
    }

    func changeBar(direction: Direction){
        model.changeBar(direction)
    }
}

