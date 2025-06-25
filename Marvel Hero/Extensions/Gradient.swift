import SwiftUI

extension LinearGradient {
  static var marvelBlue: LinearGradient {
    LinearGradient(
      gradient: Gradient(colors: [
        Color(rgbRed: 0, rgbGreen: 91, rgbBlue: 234),
        Color(rgbRed: 0, rgbGreen: 198, rgbBlue: 251)
      ]),
      startPoint: .top,
      endPoint: .bottom
    )
  }
  
  static var marvelRed: LinearGradient {
    LinearGradient(
      gradient: Gradient(colors: [
        Color(rgbRed: 237, rgbGreen: 29, rgbBlue: 36),
        Color(rgbRed: 237, rgbGreen: 31, rgbBlue: 105)
      ]),
      startPoint: .top,
      endPoint: .bottom
    )
  }
  
  static var marvelPurple: LinearGradient {
    LinearGradient(
      gradient: Gradient(colors: [
        Color(rgbRed: 178, rgbGreen: 36, rgbBlue: 239),
        Color(rgbRed: 117, rgbGreen: 121, rgbBlue: 255)
      ]),
      startPoint: .top,
      endPoint: .bottom
    )
  }
  
  static var marvelGreen: LinearGradient {
    LinearGradient(
      gradient: Gradient(colors: [
        Color(rgbRed: 11, rgbGreen: 163, rgbBlue: 96),
        Color(rgbRed: 60, rgbGreen: 186, rgbBlue: 146)
      ]),
      startPoint: .top,
      endPoint: .bottom
    )
  }
  
  static var marvelPink: LinearGradient {
    LinearGradient(
      gradient: Gradient(colors: [
        Color(rgbRed: 255, rgbGreen: 126, rgbBlue: 179),
        Color(rgbRed: 255, rgbGreen: 117, rgbBlue: 140)
      ]),
      startPoint: .top,
      endPoint: .bottom
    )
  }
  
  static var overlay: LinearGradient {
    LinearGradient(
      gradient: Gradient(colors: [ .black.opacity(0.01), .black.opacity(0.01), .black]),
      startPoint: .top,
      endPoint: .bottom
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



