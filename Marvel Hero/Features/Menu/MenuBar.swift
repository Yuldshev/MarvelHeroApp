import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct MenuBar: View {
  @Binding var vm: HomeStore
  @Environment(\.router) var router
  @Environment(\.colorScheme) var scheme
  
  let config = ResizableSheetConfig(
    detents: [.height(260), .medium],
    dragIndicator: .visible
  )
  
  var body: some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading, spacing: 24) {
        ForEach(menuItems) { item in
          MenuBarItemView(item: item)
        }
      }
      .padding(.top, 80)
      .padding(24)
      .gilroyHeavy(size: .medium)
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .withBackground(
      color: scheme == .light ? .appSilver.opacity(0.8) : .appDark,
      cornerRadius: 12
    )
  }
  
  private func showAppInfo(index: Int) {
    router.dismissModal()
    router.showScreen(.sheetConfig(config: config)) { _ in
      AppInfoView(header: aboutAppItem[index].header, text: aboutAppItem[index].text)
    }
  }
  
  private var menuItems: [MenuItem] {
    [
      MenuItem(title: "All Heroes") {
        router.dismissModal()
        router.showScreen(.push) { _ in MoreListScreen(vm: $vm) }
      },
      MenuItem(title: "Terms of Use") {
        showAppInfo(index: 0)
      },
      MenuItem(title: "Privacy Policy") {
        showAppInfo(index: 1)
      },
      MenuItem(title: "About") {
        showAppInfo(index: 2)
      }
    ]
  }
}

// MARK: - Menu Item Model
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

// MARK: - App Info View
struct AppInfoView: View {
  let header: String
  let text: String
  
  
  @Environment(\.colorScheme) var colorScheme
  var body: some View {
      VStack(alignment: .leading, spacing: 12) {
        Text(header)
          .gilroyHeavy(size: .small)
        
        Text(text)
          .gilroyRegular()
      }
      .foregroundStyle(colorScheme == .light ? .white : .black)
      .padding(24)
      .padding(.top, 24)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(colorScheme == .light ? .black : .white)
  }
}

// MARK: - Preview
#Preview {
  ZStack {
    Color.yellow.ignoresSafeArea()
    
    MenuBar(vm: .constant(HomeStore()))
  }
  .previewRouter()
}
