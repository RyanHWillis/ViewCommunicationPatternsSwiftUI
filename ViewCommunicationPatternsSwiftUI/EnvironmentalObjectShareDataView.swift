import SwiftUI

struct Note: Identifiable {
  let id = UUID().uuidString
  let title: String
}

class NotesStore: ObservableObject {
  @Published var notes: [Note] = []
}

struct ObserveEnvironmentalObjectView: View {
  @StateObject var store = NotesStore()

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
              .environmentObject(store)
          } label: {
            Text("Show Number of Notes")
          }

          NavigationLink {
            NotesListView()
              .environmentObject(store)
          } label: {
            Text("See All")
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
  static var previews: some View {
    ObserveEnvironmentalObjectView()
      .environmentObject(NotesStore())
  }
}
