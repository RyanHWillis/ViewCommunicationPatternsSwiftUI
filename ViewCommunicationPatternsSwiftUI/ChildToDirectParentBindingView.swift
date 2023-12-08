import SwiftUI

struct ChildToDirectParentBindingView: View {
  @State var isBackgroundYellow: Bool = false

  var body: some View {
    VStack {
      ChildViewOneView(isBackgroundYellow: $isBackgroundYellow) // $ symbol gives access to projectedValue which is a binding
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
    .background(isBackgroundYellow ? Color.yellow : Color.clear)
    .navigationTitle("Child to Direct Parent (Binding)")
  }
}

struct ChildToDirectParentBindingView_Previews: PreviewProvider {
  static var previews: some View {
    ChildToDirectParentCallbackView()
  }
}

private struct ChildViewOneView: View {
  @Binding var isBackgroundYellow: Bool

  var body: some View {
    Button(action: { isBackgroundYellow.toggle() }) {
      Text("Update Binding")
    }
  }
}

private struct ChildViewOneView_Previews: PreviewProvider {
  static var previews: some View {
    ChildViewOneView(isBackgroundYellow: .constant(true))
  }
}
