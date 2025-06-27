import SwiftUI
import SwiftfulUI

struct HeroListView: View {
  @Environment(\.router) var router
  var title: String = "Heroes"
  var heroes: [Hero] = mockHeroes
  
  var action: () -> Void = {}
  
  var body: some View {
    VStack(spacing: 16) {
      header(title: title, action: action)
        .padding(.horizontal, 24)
      
      ScrollView(.horizontal) {
        HStack {
          ForEach(heroes) { hero in
            HeroCard(image: hero.images.lg, name: hero.biography.fullName, comicsName: hero.name)
              .containerRelativeFrame(.horizontal, count: 2, spacing: 16)
              .scrollTransition { content, phase in
                content
                  .opacity(phase.isIdentity ? 1 : 0.6)
                  .scaleEffect(phase.isIdentity ? 1 : 0.95)
              }
              .asButton(.press) {
                router.showScreen(.push) { _ in HeroDetailScreen(hero: hero) }
              }
          }
        }
        .scrollTargetLayout()
      }
      .contentMargins(.horizontal, 24, for: .scrollContent)
      .scrollTargetBehavior(.viewAligned)
    }
    .padding(.top, 48)
  }
  
  private func header(title: String, action: @escaping () -> Void) -> some View {
    HStack {
      Text(title)
        .gilroyBold()
        .foregroundStyle(.appRed)
        .frame(maxWidth: .infinity, alignment: .leading)

      Image(systemName: "chevron.right")
        .font(.system(size: 14))
        .asButton { action() }
    }
  }
}

#Preview {
  ScrollView {
    HeroListView()
    HeroListView()
    HeroListView()
  }
  .previewRouter()
}
