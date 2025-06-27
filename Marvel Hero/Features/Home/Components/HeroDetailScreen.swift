import SwiftUI
import SwiftfulUI

struct HeroDetailScreen: View {
  var hero: Hero = mockHeroes.last!
  
  var body: some View {
    ScrollView(.vertical) {
      Header
      AppearanceSection
      BiographySection
      PowerSection
    }
    .ignoresSafeArea()
    .scrollIndicators(.hidden)
    .inlineNav(title: "")
    .background(.black)
    .swipeBackGesture()
  }
  
  //MARK: - Section View
  private var Header: some View {
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
  
  private var AppearanceSection: some View {
    HStack(spacing: 24) {
      appearanceInfo(image: "person.fill", text: hero.appearance.gender ?? "")
      appearanceInfo(image: "globe.americas", text: hero.appearance.race ?? "")
      appearanceInfo(image: "ruler", text: hero.appearance.height.last?.description ?? "")
      appearanceInfo(image: "scalemass", text: hero.appearance.weight.last?.description ?? "")
    }
    .padding()
  }
  
  private var BiographySection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Biography")
        .gilroyBold()
        .foregroundStyle(.white)
        .padding(.bottom, 8)
      
      infoColumn(
        sector1: "Name: \(hero.biography.fullName)",
        sector2: "Born: \(hero.biography.placeOfBirth ?? "")"
      )
      
      infoColumn(
        sector1: "Aliases: \(hero.biography.aliases.last ?? "")",
        sector2: "First: \(hero.biography.firstAppearance ?? "")"
      )
    }
    .padding(.horizontal, 24)
    .padding(.top, 20)
  }
  
  private var PowerSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Powers")
        .gilroyBold()
        .foregroundStyle(.white)
        .padding(.bottom, 8)
      
      ForEach(hero.powerstats.asArray, id: \.title) { power in
        powerStatBar(title: power.title, value: power.value)
      }
    }
    .padding(.horizontal, 24)
    .padding(.top, 40)
  }
  
  //MARK: - Support Func
  private func appearanceInfo(image: String, text: String) -> some View {
    VStack(spacing: 8.0) {
      Image(systemName: image)
        .frame(width: 24, height: 24)
      Text(text)
        .gilroyMedium(size: .small)
    }
    .foregroundStyle(.white)
    .frame(maxWidth: .infinity)
  }
  
  private func infoColumn(sector1: String, sector2: String) -> some View {
    HStack {
      Text(sector1)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      Text(sector2)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .foregroundStyle(.white)
    .gilroyRegular()
  }
  
  private func powerStatBar(title: String, value: Int) -> some View {
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
  HeroDetailScreen()
    .previewRouter()
    
}
