import SwiftUI

struct SelectCategoryView: View {
  @Binding var vm: HeroViewModel
  @Environment(\.router) var router
  
  var body: some View {
    VStack(spacing: 0) {
      HStack(spacing: 0.0) {
        ForEach(HeroCategory.allCases.filter { $0 != .all }, id: \.rawValue) { category in
          IconView(
            category: category,
            gradient: vm.selectedCategory == .all || vm.selectedCategory == category ? category.gradient : LinearGradient.black
          ) { vm.selectCategory(category) }
        }
      }
      .padding(.top, 8)
      .padding(.horizontal, 24)
      
      ZStack {
        if vm.selectedCategory != .all {
          HeroListView(title: vm.selectedCategory.title, heroes: vm.filteredCategory(vm.selectedCategory)) {
            router.showScreen(.push) { _ in
              DetailListView(heroes: vm.filteredCategory(vm.selectedCategory))
                .inlineNav(title: vm.selectedCategory.title)
            }
          }
            .transition(.blurReplace)
        } else {
          VStack(spacing: 0) {
            ForEach(HeroCategory.allCases.filter { $0 != .all }, id: \.rawValue) { category in
              HeroListView(title: category.title, heroes: vm.filteredCategory(category)) {
                router.showScreen(.push) { _ in
                  DetailListView(heroes: vm.filteredCategory(category))
                    .inlineNav(title: category.title)
                }
              }
            }
          }
        }
      }
      .transition(.blurReplace)
    }
    .animation(.easeInOut, value: vm.selectedCategory)
  }
}

//MARK: - Preview
#Preview {
  ScrollView(.vertical) {
    SelectCategoryView(vm: .constant(HeroViewModel()))
  }
  .previewRouter()
  .scrollIndicators(.hidden)
}
