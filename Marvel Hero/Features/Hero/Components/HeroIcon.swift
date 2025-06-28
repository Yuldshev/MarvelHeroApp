import SwiftUI

struct HeroIcon: View {
  var category: HeroCategory = .good
  var gradient: LinearGradient = LinearGradient.marvelBlue
  var shadow: Color = HeroCategory.good.color
  var action: () -> Void = {}
  
  var body: some View {
    Button { action() } label: {
      category.icon
        .foregroundStyle(.white)
        .frame(width: 56, height: 56)
        .background(gradient)
        .clipShape(Circle())
        .shadow(color: shadow ,radius: 6, y: 4)
        .frame(maxWidth: .infinity)
    }
  }
}

#Preview {
  ZStack {
    
    HStack {
      HeroIcon()
      HeroIcon()
      HeroIcon()
      HeroIcon()
      HeroIcon()
    }
    .padding(24)
  }
}
