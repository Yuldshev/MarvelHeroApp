import Foundation

enum HeroIntent {
  case loadHeroes
  case searchHeroes(query: String)
  case filterHeroes(category: HeroCategory)
}
