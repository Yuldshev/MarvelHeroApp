import SwiftUI

struct HeroDetailAppearanceSection: View {
  let hero: Hero
  
  var body: some View {
    HStack(spacing: 24) {
      AppearanceInfoView(image: "person.fill", text: hero.appearance.gender ?? "")
      AppearanceInfoView(image: "globe.americas", text: hero.appearance.race ?? "")
      AppearanceInfoView(image: "ruler", text: hero.appearance.height.last?.description ?? "")
      AppearanceInfoView(image: "scalemass", text: hero.appearance.weight.last?.description ?? "")
    }
    .padding()
  }
}

//MARK: - Helper View
private struct AppearanceInfoView: View {
  let image: String
  let text: String
  
  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: image)
        .frame(width: 24, height: 24)
      Text(text)
        .gilroyMedium(size: .small)
    }
    .foregroundStyle(.white)
    .frame(maxWidth: .infinity)
  }
}

//MARK: - Preview
#Preview {
  HeroDetailAppearanceSection(hero: mockHeroes.last!)
    .background(.black)
}
