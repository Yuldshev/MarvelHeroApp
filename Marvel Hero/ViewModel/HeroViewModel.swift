import Foundation

@Observable
final class HeroViewModel {
  var heroes: [Hero] = []
  var errorMessage: String? = nil
  
  private var networkService: NetworkServiceProtocol
  private var cacheService: CacheServiceProtocol
  
  init(service: NetworkServiceProtocol = NetworkService(), cache: CacheServiceProtocol = CacheService()) {
    self.networkService = service
    self.cacheService = cache
    
    Task { await fetchHeroes() }
  }
  
  func fetchHeroes() async {
    if let cachedHeroes = await cacheService.loadCache(key: .hero, as: [Hero].self) {
      heroes = cachedHeroes
      print("Load cached data")
    } else {
      await loadHeroes()
      print("Fetch api data")
    }
  }
  
  private func loadHeroes() async {
    guard let url = URL(string: Constants.APIHost) else { return }
    
    do {
      let response: [Hero] = try await networkService.fetchData(from: url)
      heroes = response.filter { $0.biography.publisher == "Marvel Comics"}
      await saveToCache()
    } catch {
      errorMessage = "Failed to load data: \(error)"
      print(error)
    }
  }
  
  private func saveToCache() async {
    await cacheService.saveCache(heroes, key: .hero)
  }
  
  func clearCache() async {
    await cacheService.removeCache(for: .hero)
  }
  
  //MARK: - FilterHero
  func filterGoodHeroes(by array: [Hero]) -> [Hero] {
    let goodHero = [346, 149, 659, 332, 107, 313]
    return array.filter { goodHero.contains($0.id) }
  }
  
  func filterBadHeroes(by array: [Hero]) -> [Hero] {
    let badHero = [655, 414, 680, 321, 299, 222]
    return array.filter { badHero.contains($0.id) }
  }
  
  func filterAntiHeroes(by array: [Hero]) -> [Hero] {
    let antiHero = [213, 687, 714, 99, 238, 530]
    return array.filter { antiHero.contains($0.id) }
  }
  
  func filterAlienHeroes(by array: [Hero]) -> [Hero] {
    let alienHero = [275, 234, 566, 303, 487, 431]
    return array.filter { alienHero.contains($0.id) }
  }
  
  func filterHumanHeroes(by array: [Hero]) -> [Hero] {
    let humanHero = [251, 489, 11, 107, 313, 346]
    return array.filter { humanHero.contains($0.id) }
  }
}
