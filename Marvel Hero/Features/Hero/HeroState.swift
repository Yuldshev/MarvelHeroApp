import Foundation

struct HeroState: Equatable {
  var allHeroes: [Hero]
  var heroes: [Hero]
  var selectedHero: Hero?
  var isLoading: Bool
  var error: String?
  
  static var initial: Self {
    HeroState(allHeroes: [], heroes: [], selectedHero: nil, isLoading: false, error: nil)
  }
}
