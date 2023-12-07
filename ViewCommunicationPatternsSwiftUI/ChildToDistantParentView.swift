import SwiftUI

struct ChildToDistantParentView: View {
  @State var alert: PresentableAlert? = nil
  @State var isBackgroundYellow: Bool = false

  var body: some View {
    VStack {
      ChildViewOne()
        .padding()
    }
    .onPreferenceChange(IsBackgroundYellowPreferenceKey.self) { self.isBackgroundYellow = $0 }
    .onPreferenceChange(AlertPreferenceKey.self) { self.alert = $0 }
    .alert(item: $alert) { alert in
        Alert(title: Text(alert.title), message: alert.message.map(Text.init))
    }
    .background(isBackgroundYellow ? Color.yellow : Color.black)
    .navigationTitle("Parent to Distant Child")
  }
}

struct ChildToDistantParentView_Previews: PreviewProvider {
  static var previews: some View {
    ChildToDistantParentView()
  }
}

private struct IsBackgroundYellowPreferenceKey: PreferenceKey {
  static var defaultValue: Bool = false

  static func reduce(value: inout Bool, nextValue: () -> Bool) {
    value = nextValue()
  }
}

private struct AlertPreferenceKey: PreferenceKey {
  static var defaultValue: PresentableAlert?

  static func reduce(value: inout PresentableAlert?, nextValue: () -> PresentableAlert?) {
    value = nextValue()
  }
}

struct PresentableAlert: Equatable, Identifiable {
  let id = UUID()
  let title: String
  let message: String?

  static func == (lhs: PresentableAlert, rhs: PresentableAlert) -> Bool {
    lhs.id == rhs.id
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
    .background(Color.green)
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
    .background(Color.blue)
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
    .background(Color.purple)
  }
}

private struct ChildViewFour: View {
  @State private var alert: PresentableAlert?
  @State private var isBackgroundYellow: Bool = false

  var body: some View {
    VStack(spacing: 100) {
      Text("Child Four")
      Button("Trigger Parent Alert") {
        alert = PresentableAlert(
          title: "Hello there!",
          message: "The alert property set in child four surfaced this alert in the parent."
        )
      }
      .preference(key: AlertPreferenceKey.self, value: alert)

      Button("Toogle Parent Background") {
        isBackgroundYellow.toggle()
      }
      .preference(key: IsBackgroundYellowPreferenceKey.self, value: isBackgroundYellow)

    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.mint)
  }
}
