import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : RhythmRandomizerVM
    
    var body: some View {
        HStack() {
            Spacer()
            Image(systemName: "arrow.left").border(.green).font(.largeTitle).onTapGesture {
                viewModel.randomize()
            }
            Spacer()
            NoteView(note: viewModel.onlyRiddim)
            Spacer()
            Image(systemName: "arrow.right").border(.green).font(.largeTitle).onTapGesture {
                viewModel.randomize()
            }
            Spacer()
        }
    }
}


struct NoteView: View {
    let note: RhythmApp.Rhythm
    var body: some View {
        HStack {
            Image(note.name)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RhythmRandomizerVM()
        ContentView(viewModel: model)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
