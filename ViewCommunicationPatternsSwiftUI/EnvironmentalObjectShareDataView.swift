import SwiftUI

struct Note: Identifiable {
  let id = UUID().uuidString
  let title: String
}

// ObservableObject is the dats surface needed for the view, usually populated by a data model.

class NotesStore: ObservableObject {
  @Published var notes: [Note] = [] // marking as @Published will mean the view will reload when the values changes.
}

struct ObserveEnvironmentalObjectView: View {
  @StateObject var store = NotesStore() // source of truth

  @AppStorage("isToggleOn") private var isToggleOn = false // stuff gets stored in user defaults

  var body: some View {
    NavigationStack {
      Text("\(store.notes.count) notes")

      VStack {
        Button("Add Note") {
          store.notes.append(Note(title: "New Note"))
        }

        VStack(spacing: 40) {
          NavigationLink {
            NotesOverviewView()
              .environmentObject(store) // set environment object, note it only works on below heirarchy and means can pass without init on view
          } label: {
            Text("Show Number of Notes")
          }

          NavigationLink {
            NotesListView()
              .environmentObject(store) // set environment object, note it only works on below heirarchy and means can pass without init on view
          } label: {
            Text("See All")
          }

          Toggle(isOn: $isToggleOn) {
            Text("Test Toggle")
          }
        }
        .padding()
        .background(Color.yellow)
        .frame(maxWidth: .infinity)
      }
      .frame(height: 200)
      .background(Color.green)
    }
  }
}

struct NotesOverviewView: View {
  @EnvironmentObject var store: NotesStore

  var body: some View {
    Text("There are currently \(store.notes.count) added notes.")
  }
}

struct NotesListView: View {
  @EnvironmentObject var store: NotesStore

  var body: some View {
    List {
      if store.notes.isEmpty {
        Text("No Notes Added")
      } else {
        ForEach(store.notes) { note in
          Text(note.title)
        }
      }
    }
  }
}

struct ObserveEnvironmentalObjectView_Previews: PreviewProvider {
  @AppStorage("isToggleOn") static var isToggleOn: Bool?

  static var previews: some View {
    isToggleOn = nil
    return ObserveEnvironmentalObjectView()
      .environmentObject(NotesStore())
  }
}


// You can now simplify this!

/*

 // Remove conformance of ObservableObject, remove @published, and observe new macro

 @Obseravle
 class NotesStore {
 var notes: [Note] = []
 }

 // remove @ObservedObject if you have it in front of a var (if passed in via init), and @EnvironmentObject to @Environment if using that.

 struct NotesListView: View {
 @Environment var store: NotesStore
 ...

 */

@Observable // ONLY iOS17
class User {
  var firstName = "Bilbo"
  var lastName = "Baggins"
}

// because this is a class, a reference type means a new value for the objected is not created like with a struct value type - which is recreated each time allowing swiftui to pick up the change.

struct ObservableMacroView: View {
  @State private var user = User()

  var body: some View {
    VStack {
      Text("Your name is \(user.firstName) \(user.lastName).")

      TextField("First name", text: $user.firstName)
      TextField("Last name", text: $user.lastName)

      ObservableMacroChildView(user: user)
    }
  }
}

struct ObservableMacroChildView: View {
  var user: User // make @Binding for read/write with textfield in here.

  var body: some View {
    VStack {
      Text(user.firstName)
//      TextField("first name again?", text: $user.firstName)
//        .background(.red)
    }
  }
}

struct ObservableMacroView_Previews: PreviewProvider {
  static var previews: some View {
    ObservableMacroView()
  }
}
