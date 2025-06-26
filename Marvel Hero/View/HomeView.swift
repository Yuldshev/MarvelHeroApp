import SwiftUI
import SwiftfulUI

struct HomeView: View {
  @State var vm = HeroViewModel()
  @State var offset: CGPoint = .zero
  
  var body: some View {
    ScrollViewWithOnScrollChanged {
      LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
        Section {
          SectionView
        } header: {
          MarvelHeaderView(offset: $offset, vm: $vm)
        }
      }
    } onScrollChanged: { origin in
      offset = origin
    }
    .scrollIndicators(.hidden)
    .clipped()
    .toolbar(.hidden, for: .navigationBar)
  }
  
  private var Title: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Welcome to Marvel Heroes")
        .gilroySemibold()
        .foregroundStyle(.appGrey)
      Text("Choose your character")
        .gilroyHeavy(size: .large)
    }
    .padding(24)
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var SectionView: some View {
    VStack(spacing: 0) {
      if vm.searchText.isEmpty {
        VStack(spacing: 0) {
          Title
          SelectCategoryView(vm: $vm)
        }
        .transition(.blurReplace)
      } else {
        SearchListView(vm: $vm)
          .transition(.blurReplace)
      }
    }
    .animation(.easeInOut, value: vm.searchText)
  }
}



//MARK: - Preview
#Preview {
  HomeView()
    .previewRouter()
}
