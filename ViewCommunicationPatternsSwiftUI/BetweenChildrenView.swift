import SwiftUI

struct BetweenChildrenView: View {
  @State var isOn = false

  var body: some View {
    VStack {

      Toggle(isOn: $isOn) { EmptyView() }
        .labelsHidden()

      Button(action: { self.isOn.toggle() }) {
        self.isOn ? Text("Turn Off") : Text("Turn On")
      }
    }
  }
}

struct BetweenChildrenView_Previews: PreviewProvider {
  static var previews: some View {
    BetweenChildrenView()
  }
}
