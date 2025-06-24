import SwiftUI

extension View {
  func gradientBlue() -> some View {
    self
      .background(
        LinearGradient(
          gradient: Gradient(colors: [
            Color(rgbRed: 0, rgbGreen: 91, rgbBlue: 234),
            Color(rgbRed: 0, rgbGreen: 198, rgbBlue: 251)
          ]),
          startPoint: .top,
          endPoint: .bottom
        )
      )
  }
  
  func gradientRed() -> some View {
    self
      .background(
        LinearGradient(
          gradient: Gradient(colors: [
            Color(rgbRed: 237, rgbGreen: 29, rgbBlue: 36),
            Color(rgbRed: 237, rgbGreen: 31, rgbBlue: 105)
          ]),
          startPoint: .top,
          endPoint: .bottom
        )
      )
  }
  
  func gradientPurple() -> some View {
    self
      .background(
        LinearGradient(
          gradient: Gradient(colors: [
            Color(rgbRed: 178, rgbGreen: 36, rgbBlue: 239),
            Color(rgbRed: 117, rgbGreen: 121, rgbBlue: 255)
          ]),
          startPoint: .top,
          endPoint: .bottom
        )
      )
  }
  
  func gradientGreen() -> some View {
    self
      .background(
        LinearGradient(
          gradient: Gradient(colors: [
            Color(rgbRed: 11, rgbGreen: 163, rgbBlue: 96),
            Color(rgbRed: 60, rgbGreen: 186, rgbBlue: 146)
          ]),
          startPoint: .top,
          endPoint: .bottom
        )
      )
  }
  
  func gradientPink() -> some View {
    self
      .background(
        LinearGradient(
          gradient: Gradient(colors: [
            Color(rgbRed: 255, rgbGreen: 126, rgbBlue: 179),
            Color(rgbRed: 255, rgbGreen: 117, rgbBlue: 140)
          ]),
          startPoint: .top,
          endPoint: .bottom
        )
      )
  }
  
  func gradientOverlay() -> some View {
    self
      .background(
        LinearGradient(
          gradient: Gradient(colors: [ .black.opacity(0.001), .black.opacity(0.001), .black]),
          startPoint: .top,
          endPoint: .bottom
        )
      )
  }
}

extension Color {
  init(rgbRed: CGFloat, rgbGreen: CGFloat, rgbBlue: CGFloat) {
    self.init(
      red: rgbRed / 255,
      green: rgbGreen / 255,
      blue: rgbBlue / 255
    )
  }
}



