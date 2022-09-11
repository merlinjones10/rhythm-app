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
