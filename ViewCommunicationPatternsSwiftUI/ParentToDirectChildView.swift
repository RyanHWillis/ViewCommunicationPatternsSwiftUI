import SwiftUI

struct ParentToDirectChildView: View {
  var body: some View {
    VStack {
      ChildViewOne(backgroundColor: .red)
    }
    .background(Color.white)
    .navigationTitle("ParentToDirectChildView")
  }
}

private struct ChildViewOne: View {
  let backgroundColor: Color

  var body: some View {
    VStack(spacing: 100) {
      Text("Child One")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(backgroundColor)
  }
}

struct ParentToDirectChildView_Previews: PreviewProvider {
  static var previews: some View {
    ParentToDirectChildView()
  }
}
