import SwiftUI
import SwiftfulUI

struct SearchListView: View {
  @Binding var vm: HomeStore
  @State var searchHeroes: [Hero] = []
  @Environment(\.router) var router
  
  let columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
  ]
  
  var body: some View {
    DetailListView(heroes: searchHeroes)
    .onChange(of: vm.searchText) { _, newQuery in
      searchHeroes = vm.searchHeroes(newQuery)
    }
  }
}

#Preview {
  SearchListView(vm: .constant(HomeStore()), searchHeroes: mockHeroes)
    .previewRouter()
}
