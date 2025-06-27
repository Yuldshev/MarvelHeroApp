import SwiftUI

struct HeroIcon: View {
  var category: HeroCategory = .all
  var gradient: LinearGradient = LinearGradient.marvelBlue
  var action: () -> Void = {}
  
  var body: some View {
    Button { action() } label: {
      category.icon
        .foregroundStyle(.white)
        .frame(width: 56, height: 56)
        .background(gradient)
        .clipShape(Circle())
        .frame(maxWidth: .infinity)
    }
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
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
