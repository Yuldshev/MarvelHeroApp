import SwiftUI
import SwiftfulUI

struct HeroCard: View {
  var image: String = mockHeroes.last!.images.lg
  var name: String = mockHeroes.last!.biography.fullName
  var comicsName: String = mockHeroes.last!.name
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(name)
        .gilroyMedium(size: .small)
        .opacity(0.75)
        
      Text(comicsName)
        .gilroyHeavy(size: .small)
        .lineLimit(2)
        .minimumScaleFactor(0.8)
        .frame(width: 100, alignment: .leading)
        
    }
    .padding(.bottom, 12)
    .padding(.horizontal, 12)
    .foregroundStyle(.white)
    .frame(height: 230, alignment: .bottomLeading)
    .frame(maxWidth: .infinity, alignment: .bottomLeading)
    .background(
      KingfisherLoader(url: image)
        .overlay {
          LinearGradient.overlay
        }
    )
    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
  }
}

#Preview {
  HStack {
    HeroCard()
    HeroCard()
    HeroCard()
  }
    
}
