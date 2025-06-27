import Foundation
import SwiftUI

extension HomeStore {
  func selectCategory(_ category: HeroCategory) {
    withAnimation(.easeInOut) {
      if selectedCategory == category {
        selectedCategory = .all
      } else {
        selectedCategory = category
      }
    }
  }
  
  func filteredCategory(_ category: HeroCategory, limit: Int? = nil) -> [Hero] {
    let filteredHeroes: [Hero]
    
    switch category {
      case .good: return filterGoodHeroes()
      case .bad: return filterBadHeroes()
      case .anti: return filterAntiHeroes()
      case .alien: return filterAlienHeroes()
      case .human: return filterHumanHeroes()
      case .all: filteredHeroes = heroes
    }
    
    if let limit = limit {
      return Array(filteredHeroes.prefix(limit))
    } else {
      return filteredHeroes
    }
  }
}
