import Foundation

@Observable
final class HomeStore {
  var heroes: [Hero] = []
  var selectedCategory: HeroCategory = .all
  var searchText: String = ""
  
  var errorMessage: String? = nil
  
  private var networkService: NetworkProtocol
  private var cacheService: CacheServiceProtocol
  
  init(service: NetworkProtocol = Network(), cache: CacheServiceProtocol = CacheService()) {
    self.networkService = service
    self.cacheService = cache
    
    Task { await fetchHeroes() }
  }
  
  func fetchHeroes() async {
    if let cachedHeroes = await cacheService.loadCache(key: .hero, as: [Hero].self) {
      heroes = cachedHeroes
    } else {
      await loadHeroes()
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
}
