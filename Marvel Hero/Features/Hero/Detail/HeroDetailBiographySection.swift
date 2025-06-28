import SwiftUI

struct HeroDetailBiographySection: View {
  let hero: Hero
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Biography")
        .gilroyBold()
        .foregroundStyle(.white)
        .padding(.bottom, 8)
      
      InfoColumnView(
        sector1: "Name: \(hero.biography.fullName)",
        sector2: "Born: \(hero.biography.placeOfBirth ?? "")"
      )
      
      InfoColumnView(
        sector1: "Aliases: \(hero.biography.aliases.last ?? "")",
        sector2: "First: \(hero.biography.firstAppearance ?? "")"
      )
    }
    .padding(.horizontal, 24)
    .padding(.top, 20)
  }
}

//MARK: - Helper View
private struct InfoColumnView: View {
  let sector1: String
  let sector2: String
  
  var body: some View {
    HStack {
      Text(sector1)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      Text(sector2)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .foregroundStyle(.white)
    .gilroyRegular()
  }
}

//MARK: - Preview
#Preview {
  HeroDetailBiographySection(hero: mockHeroes.last!)
}
