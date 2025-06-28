import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct MenuBar: View {
  @Binding var vm: HeroStore
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
      color: scheme == .light ? .appSilver : .appDark,
      cornerRadius: 12
    )
  }
  
  private func showAppInfo(index: Int) {
    router.dismissModal()
    router.showScreen(.sheetConfig(config: config)) { _ in
      AppInfo(header: aboutAppItem[index].header, text: aboutAppItem[index].text)
    }
  }
  
  private var menuItems: [MenuItem] {
    [
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

// MARK: - Preview
#Preview {
  MenuBar(vm: .constant(HeroStore()))
    .previewRouter()
}
