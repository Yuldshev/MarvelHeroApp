import Foundation
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
}
