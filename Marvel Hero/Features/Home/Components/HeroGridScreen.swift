import SwiftUI
import SwiftfulUI

struct HeroGridScreen: View {
  @Environment(\.router) var router
  var heroes: [Hero] = mockHeroes
  var columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 16) {
      ForEach(heroes) { hero in
        HeroCard(image: hero.images.lg, name: hero.name, comicsName: hero.biography.fullName)
          .asButton(.press) {
            router.showScreen(.push) { _ in HeroDetailScreen(hero: hero) }
          }
      }
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 24)
  }
}

#Preview {
  HeroGridScreen()
}
