import Foundation
import SwiftUI

extension HeroViewModel {
  func selectCategory(_ category: HeroCategory) {
    withAnimation(.easeInOut) {
      if selectedCategory == category {
        selectedCategory = .all
      } else {
        selectedCategory = category
      }
    }
  }
  
  func filteredCategory(_ category: HeroCategory) -> [Hero] {
    switch category {
      case .good: return filterGoodHeroes()
      case .bad: return filterBadHeroes()
      case .anti: return filterAntiHeroes()
      case .alien: return filterAlienHeroes()
      case .human: return filterHumanHeroes()
      case .all: return heroes
    }
  }
}
