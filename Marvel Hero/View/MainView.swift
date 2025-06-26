import SwiftUI
import SwiftfulRouting

struct MainView: View {
  @State var vm = HeroViewModel()
  @State private var route: AppRoute = .splash
  @State private var isContentReady = false
  
  var body: some View {
    ZStack {
      switch route {
        case .splash:
          SplashView()
          
        case .home:
          RouterView { _ in
            HomeView(vm: $vm)
              .onFullyRendered { isContentReady = true }
          }
          .skeleton(!isContentReady)
      }
    }
    .animation(.easeInOut, value: route)
    .task {
      try? await Task.sleep(for: .seconds(3))
      route = .home
    }
  }
}

//MARK: - Route
enum AppRoute {
  case splash, home
}

//MARK: - Preview
#Preview {
  MainView()
}
