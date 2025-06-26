import SwiftUI

struct SearchListView: View {
  @Binding var vm: HeroViewModel
  @State var searchHeroes: [Hero] = []
  
  var body: some View {
    DetailListView(heroes: searchHeroes)
      .onChange(of: vm.searchText) { _, newQuery in
        searchHeroes = vm.searchHeroes(newQuery)
      }
  }
}

#Preview {
  SearchListView(vm: .constant(HeroViewModel()), searchHeroes: mockHeroes)
}
