import SwiftUI

struct MainView: View {
  @State var vm = HeroViewModel()
  
  var body: some View {
    VStack {
      List(vm.heroes, id: \.id) { hero in
        HStack {
          Text(hero.id.description)
          Text(hero.name)
        }
      }
      
      if vm.errorMessage != nil {
        Text(vm.errorMessage ?? "")
      }
    }
    .task {
      await vm.fetchHeroes()
    }
  }
}

#Preview {
  MainView()
}
