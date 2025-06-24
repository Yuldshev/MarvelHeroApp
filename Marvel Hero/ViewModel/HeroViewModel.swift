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
}
