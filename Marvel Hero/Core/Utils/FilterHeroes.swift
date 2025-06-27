import Foundation

extension HeroViewModel {
  func filterGoodHeroes() -> [Hero] {
    let goodHero = [346, 149, 659, 332, 107, 313]
    return heroes.filter { goodHero.contains($0.id) }
  }
  
  func filterBadHeroes() -> [Hero] {
    let badHero = [655, 414, 680, 321, 299, 222]
    return heroes.filter { badHero.contains($0.id) }
  }
  
  func filterAntiHeroes() -> [Hero] {
    let antiHero = [213, 687, 714, 99, 238, 530]
    return heroes.filter { antiHero.contains($0.id) }
  }
  
  func filterAlienHeroes() -> [Hero] {
    let alienHero = [275, 234, 566, 303, 487, 431]
    return heroes.filter { alienHero.contains($0.id) }
  }
  
  func filterHumanHeroes() -> [Hero] {
    let humanHero = [251, 489, 11, 107, 313, 346]
    return heroes.filter { humanHero.contains($0.id) }
  }
  
  func searchHeroes(_ query: String) -> [Hero] {
    let lowercasedQuery = query.lowercased()
    let filteredHeroes = heroes.filter { hero in
      hero.name.lowercased().contains(lowercasedQuery) ||
      hero.biography.fullName.lowercased().contains(lowercasedQuery)
    }
    
    return filteredHeroes
  }
}
