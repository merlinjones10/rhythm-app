import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : RhythmRandomizerVM
    
    let data = Array(1...4).map{"item\($0)"}
    
    let oneRowGrid = [GridItem(.fixed(4))]
    
    var body: some View {
        VStack{
            BarView(bar: viewModel.bars[0])
            BarView(bar: viewModel.bars[1])

//            Controls(viewModel: viewModel)
        }
    }
}

struct BarView: View {
    let bar: MusicalBar
    let oneRowGrid = [GridItem(.fixed(4))]
    var body: some View {
        HStack {
            InlineControls()
            LazyHGrid(rows: oneRowGrid, spacing: 5.0 ) {
                ForEach(bar.bar.indices, id: \.self) { index in
                    Image(bar.bar[index]).resizable().aspectRatio(contentMode: .fit).frame(width: 175, height: 100, alignment: .leading)
                }
                
            }
            Image(systemName: "arrow.right").frame(width: 30, height: 100, alignment: .topLeading)
            
        }

    }
}
struct InlineControls: View {
//    var viewModel: RhythmRandomizerVM
    // MARK: - to do
    // attach controls to buttons to change bar
    var body: some View {
        VStack {
            Image(systemName: "arrow.left")
            Spacer()
            Image(systemName: "dice")
        }.frame(width: 30 , height: 100, alignment: .topLeading).border(.blue)
        
    }
}
struct Controls: View {
    var viewModel: RhythmRandomizerVM
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "arrow.left").onTapGesture {
                viewModel.changeBar(direction: .left)
            }
            Spacer()
            Image(systemName: "dice").onTapGesture {
                viewModel.changeBar(direction: .random)
            }
            Spacer()
                Image(systemName: "arrow.right").onTapGesture {
                    viewModel.changeBar(direction: .right)
                }
            Spacer()
        }.padding().border(.green)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RhythmRandomizerVM()
        ContentView(viewModel: model)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
