import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : RhythmRandomizerVM
    
    let data = Array(1...4).map{"item\($0)"}
    
    let oneRowGrid = [GridItem(.fixed(4))]
    
    var body: some View {
        VStack{
            Text("Notes").font(.title2)
            LazyHGrid(rows: oneRowGrid, spacing: 10) {
                ForEach(viewModel.bar, id: \.self) {item in
                    Image(item.name)
                }
            }
            HStack {
                Spacer()
                Image(systemName: "arrow.left").onTapGesture {
                    viewModel.rotatebar(direction: .left)
                }
                Spacer()
                Image(systemName: "dice").onTapGesture {
                    viewModel.randomizeRhythms()
                }
                Spacer()
                Image(systemName: "arrow.right").onTapGesture {
                    viewModel.rotatebar(direction: .right)
                }
                Spacer()
            }.padding().border(.green)
        }
    }
}

struct BarView: View {
    var body: some View {
        Text("Hello")
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
