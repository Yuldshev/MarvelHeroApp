import SwiftUI

struct HeroDetailHeader: View {
  let hero: Hero
  
  var body: some View {
    ZStack {
      LinearGradient.overlay
        .zIndex(1)
      
      KingfisherLoader(url: hero.images.lg)
        .frame(height: 600)
        .asStretchyHeader(startingHeight: 400)
        .offset(y: -8)
        .zIndex(0)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(hero.biography.fullName)
          .gilroyMedium(size: .large)
          .opacity(0.8)
        Text(hero.name)
          .gilroyHeavy(size: .large)
      }
      .foregroundStyle(.white)
      .padding(24)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
      .zIndex(2)
    }
  }
}

#Preview {
  HeroDetailHeader(hero: mockHeroes.last!)
}
