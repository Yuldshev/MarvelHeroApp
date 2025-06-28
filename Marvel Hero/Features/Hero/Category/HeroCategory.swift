import SwiftUI

enum HeroCategory: String, CaseIterable {
  case all, good, bad, anti, alien, human
  
  var title: String {
    switch self {
      case .all: return "All"
      case .good: return "Heroes"
      case .bad: return "Villains"
      case .anti: return "Antagonists"
      case .alien: return "Aliens"
      case .human: return "Humans"
    }
  }
  
  var icon: Image {
    switch self {
      case .all: return Image(.iconKVM)
      case .good: return Image(.iconKVM)
      case .bad: return Image(.iconVillains)
      case .anti: return Image(.iconMutants)
      case .alien: return Image(.iconAlien)
      case .human: return Image(.iconHuman)
    }
  }
  
  var gradient: LinearGradient {
    switch self {
      case .all: return LinearGradient.marvelBlue
      case .good: return LinearGradient.marvelBlue
      case .bad: return LinearGradient.marvelRed
      case .anti: return LinearGradient.marvelPurple
      case .alien: return LinearGradient.marvelGreen
      case .human: return LinearGradient.marvelPink
    }
  }
  
  var color: Color {
    switch self {
      case .all: return .black
      case .good: return Color(rgbRed: 0, rgbGreen: 91, rgbBlue: 234)
      case .bad: return Color(rgbRed: 237, rgbGreen: 29, rgbBlue: 36)
      case .anti: return  Color(rgbRed: 178, rgbGreen: 36, rgbBlue: 239)
      case .alien: return Color(rgbRed: 11, rgbGreen: 163, rgbBlue: 96)
      case .human: return Color(rgbRed: 255, rgbGreen: 126, rgbBlue: 179)
    }
  }
}
