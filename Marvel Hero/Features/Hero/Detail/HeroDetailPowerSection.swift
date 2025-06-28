import SwiftUI

struct HeroDetailPowerSection: View {
  let hero: Hero
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Powers")
        .gilroyBold()
        .foregroundStyle(.white)
        .padding(.bottom, 8)
      
      ForEach(hero.powerstats.asArray, id: \.title) { power in
        PowerStatBar(title: power.title, value: power.value)
      }
    }
    .padding(.horizontal, 24)
    .padding(.top, 40)
  }
}

//MARK: - Helper View
private struct PowerStatBar: View {
  let title: String
  let value: Int
  
  var body: some View {
    HStack {
      Text(title)
        .gilroyRegular()
        .frame(width: 80, alignment: .leading)
      ProgressView(value: Double(value), total: 100)
        .tint(.appRed)
        .frame(height: 6)
        .clipShape(Capsule())
    }
    .foregroundStyle(.white)
  }
}

//MARK: - Preview
#Preview {
  HeroDetailPowerSection(hero: mockHeroes.last!)
}
