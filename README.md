# ViewCommunicationPatternsSwiftUI

Example app demonstrating the different communication patterns in SwiftUI.

**View Communication Patterns**

- Parent to Distant Child (Custom Environment)
- Parent to Direct Child
- Child to Distant Parent (Preference Key)
- Child to Direct Parent (Callback)
- Child to Direct Parent (Binding)
- Between Children

---

- A `@State` property is a source of truth. One view owns it and passes either its value or a reference, known as a binding, to its subviews.
- A `@Binding` property is a reference to a @State property owned by another view. It gets its initial value when the other view passes it a binding, using the $ prefix. Having this reference to the source of truth enables the subview to change the property’s value, and this changes the state of any view that depends on this property.
- `@EnvironmentObject` declares dependency on some shared data — data that’s visible to all views in a sub-tree of the app. It’s a convenient way to pass data indirectly instead of passing data from parent view to child to grandchild, especially if the in-between child view doesn’t need it.

There are also default `@EnvironemtValues` that come built in, such as `.dismiss`/`.presented` used for sheets, `.colorSheme` used for light & dark mode, `.isHighlighted` and `.isEnabled` used with cells etc...
