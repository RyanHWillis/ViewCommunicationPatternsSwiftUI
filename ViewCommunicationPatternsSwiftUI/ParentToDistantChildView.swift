import SwiftUI

struct ParentToDistantChildView: View {
  @State private var isChildFourBackgroundRed = false

  var body: some View {
    VStack {
      ChildViewOne()
        .environment(\.isBackgroundRed, isChildFourBackgroundRed)
        .padding()
      Button("Toggle Child Four Background Colour") {
        isChildFourBackgroundRed.toggle()
      }
    }
    .background(Color.white)
    .navigationTitle("Parent to Distant Child")
  }
}

private struct IsBackgroundRedKey: EnvironmentKey {
  static var defaultValue: Bool = false
}

private extension EnvironmentValues {
  var isBackgroundRed: Bool {
    get { self[IsBackgroundRedKey.self] }
    set { self[IsBackgroundRedKey.self] = newValue }
  }
}

struct ParentToDistantChildView_Previews: PreviewProvider {
  static var previews: some View {
    ParentToDistantChildView()
  }
}

private struct ChildViewOne: View {
  var body: some View {
    VStack(spacing: 100) {
      Text("Child One")

      ChildViewTwo()
        .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.yellow)
  }
}

private struct ChildViewTwo: View {
  var body: some View {
    VStack(spacing: 100) {
      Text("Child Two")

      ChildViewThree()
        .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.purple)
  }
}

private struct ChildViewThree: View {
  var body: some View {
    VStack(spacing: 100) {
      Text("Child Three")

      ChildViewFour()
        .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.green)
  }
}

private struct ChildViewFour: View {
  @Environment(\.isBackgroundRed) var isBackgroundRed: Bool

  var body: some View {
    VStack(spacing: 100) {
      Text("Child Four")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(isBackgroundRed ? Color.red : Color.mint)
  }
}
