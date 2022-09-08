//
//  RhythmRandomApp.swift
//  RhythmRandom
// TOP LEVEL APP, Not Model
//  Created by Merlin Jones on 07/09/2022.
//

import SwiftUI

@main
struct RhythmRandomApp: App {
    var body: some Scene {
        WindowGroup {
            let model = RhythmRandomizerVM()
            ContentView(viewModel: model)
        }
    }
}
