import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      VStack(spacing: 40) {
        NavigationLink("Parent to Distant Child (Custom Environment)") {
          ParentToDistantChildView()
        }

        NavigationLink("Parent to Direct Child") {
          ParentToDirectChildView()
        }

        NavigationLink("Child to Distant Parent (Preference Key)") {
          ChildToDistantParentView()
        }

        NavigationLink("Child to Direct Parent (Callback)") {
          ChildToDirectParentCallbackView()
        }

        NavigationLink("Child to Direct Parent (Binding)") {
          ChildToDirectParentBindingView()
        }

        NavigationLink("Between Children") {
          BetweenChildrenView()
        }

        NavigationLink("Observe Environment Object") {
          ObserveEnvironmentalObjectView()
        }
      }
      .navigationTitle("View Communication Patterns")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

// https://jaredsinclair.com/2020/05/07/swiftui-cheat-sheet.html
