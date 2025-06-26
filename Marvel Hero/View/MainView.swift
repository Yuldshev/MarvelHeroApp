import SwiftUI
import SwiftfulRouting

struct MainView: View {
  
  var body: some View {
    VStack {
      RouterView { _ in HomeView() }
    }
  }
}

#Preview {
  MainView()
}
