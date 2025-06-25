import SwiftUI

struct IconView: View {
  var image: Image = Image(.iconAlien)
  var background: LinearGradient = LinearGradient.marvelRed
  var action: () -> Void = {}
  
  var body: some View {
    Button { action() } label: {
      image
        .foregroundStyle(.white)
        .frame(width: 56, height: 56)
        .background(background)
        .clipShape(Circle())
        .frame(maxWidth: .infinity)
    }
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    HStack {
      IconView()
      IconView()
      IconView()
      IconView()
      IconView()
    }
    .padding(24)
  }
}
