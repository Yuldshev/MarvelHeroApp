import SwiftUI
import SwiftfulUI

struct SearchList: View {
  @Binding var vm: HomeStore
  @State var searchHeroes: [Hero] = []
  @Environment(\.router) var router
  
  let columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
  ]
  
  var body: some View {
    HeroGridScreen(heroes: searchHeroes)
    .onChange(of: vm.searchText) { _, newQuery in
      searchHeroes = vm.searchHeroes(newQuery)
    }
  }
}

#Preview {
  SearchList(vm: .constant(HomeStore()), searchHeroes: mockHeroes)
    .previewRouter()
}
