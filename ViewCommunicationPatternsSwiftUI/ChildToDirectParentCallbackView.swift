import SwiftUI

struct ChildToDirectParentCallbackView: View {
  @State var isBackgroundYellow: Bool = false

  var body: some View {
    VStack {
      ChildViewOneView {
        isBackgroundYellow.toggle()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding()
    }
    .background(isBackgroundYellow ? Color.yellow : Color.clear)
    .navigationTitle("Child to Direct Parent (Callback)")
  }
}

private struct ChildViewOneView: View {
  let onDetail: () -> Void

  var body: some View {
    Button(action: onDetail) {
      Text("Callback")
    }
  }
}

struct ChildToDirectParentCallbackView_Previews: PreviewProvider {
  static var previews: some View {
    ChildToDirectParentCallbackView()
  }
}
