import SwiftUI

struct SelectCategory: View {
  @Binding var vm: HeroStore
  @Environment(\.router) var router
  
  var body: some View {
    HStack(spacing: 0) {
      ForEach(HeroCategory.allCases.filter { $0 != .all }, id: \.rawValue) { category in
        HeroIcon(
          category: category,
          gradient: vm.selectedCategory == .all || vm.selectedCategory == category ? category.gradient : LinearGradient.black,
          shadow: vm.selectedCategory == category ? category.color : .clear
        ) {
          Task {
            await vm.dispatch(intent: .filterHeroes(category: category))
          }
        }
        .animation(.easeInOut, value: vm.selectedCategory)
      }
    }
    .padding(.top, 8)
    .padding(.horizontal, 24)
  }
}

//MARK: - Preview
#Preview {
  SelectCategory(vm: .constant(HeroStore()))
    .previewRouter()
}
