import SwiftUI
import SwiftfulUI

struct HeroDetail: View {
  var hero: Hero = mockHeroes.last!
  @Environment(\.router) var router
  
  var body: some View {
    ScrollView(.vertical) {
      HeroDetailHeader(hero: hero)
      HeroDetailAppearanceSection(hero: hero)
      HeroDetailBiographySection(hero: hero)
      HeroDetailPowerSection(hero: hero)
    }
    .ignoresSafeArea()
    .scrollIndicators(.hidden)
    .toolbar(.hidden, for: .navigationBar)
    .background(.black)
    .swipeBackGesture()
    .overlay(alignment: .topLeading) {
      dismissButton
    }
  }
}

//MARK: - Helper Dismiss Button
extension HeroDetail {
  private var dismissButton: some View {
    Image(systemName: "xmark")
      .foregroundStyle(.white)
      .padding()
      .background(.black.opacity(0.8))
      .clipShape(Circle())
      .padding(.leading, 12)
      .asButton(.press) {
        router.dismissScreen()
      }
  }
}

//MARK: - Preview
#Preview {
  HeroDetail()
    .previewRouter()
    
}
