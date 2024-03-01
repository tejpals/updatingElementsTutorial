import SwiftData
import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = textUpdater()
  var body: some View {
    VStack {
      Color.mint
      Text(viewModel.elementText)
        .font(.title)
        .padding(30)
        .background(Color(white: 0.3))
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
        .foregroundColor(Color(white: 0.9))
      Spacer(minLength: UIScreen.main.bounds.height * 0.3)
      Button("Update") {
        viewModel.getText()
      }
      .font(.title)
      .foregroundColor(Color(white: 0.9))
      .padding(30)
      .background(Color(white: 0.3))
      .clipShape(Capsule())
    }
    .background(Color.mint)
  }
  final class textUpdater: ObservableObject {
    @Published var elementText: String = ""
    func getText() {
      self.elementText = String(Int.random(in: 1..<100))
    }
  }
}

#Preview {
  ContentView()
}
