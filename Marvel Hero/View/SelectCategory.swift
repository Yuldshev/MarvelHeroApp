import SwiftUI

struct SelectCategoryView: View {
  @Binding var vm: HeroViewModel
  
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
          HeroListView(title: vm.selectedCategory.title, heroes: vm.filteredCategory(vm.selectedCategory))
            .transition(.blurReplace)
        } else {
          VStack(spacing: 0) {
            ForEach(HeroCategory.allCases.filter { $0 != .all }, id: \.rawValue) { category in
              HeroListView(title: category.title, heroes: vm.filteredCategory(category))
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
  .scrollIndicators(.hidden)
}
