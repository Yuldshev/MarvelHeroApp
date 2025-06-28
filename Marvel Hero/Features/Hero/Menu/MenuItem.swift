import SwiftUI

struct MenuItem: Identifiable {
  let id = UUID()
  let title: String
  let action: () -> Void
}

// MARK: - Menu Item View
struct MenuBarItemView: View {
  let item: MenuItem
  
  var body: some View {
    Text(item.title)
      .asButton(.press) {
        item.action()
      }
  }
}
