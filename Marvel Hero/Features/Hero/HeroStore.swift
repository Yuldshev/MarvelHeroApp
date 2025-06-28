import Foundation

@Observable
@MainActor
final class HeroStore {
  var state: HeroState
  var selectedCategory: HeroCategory = .all
  var searchQuery: String = ""
  
  private var networkService: NetworkProtocol
  private var cacheService: CacheProtocol
  
  init(state: HeroState = .initial, service: NetworkProtocol = Network(), cache: CacheProtocol = Cache()) {
    self.state = state
    self.networkService = service
    self.cacheService = cache
  }
  
  func dispatch(intent: HeroIntent) async {
    switch intent {
      case .loadHeroes:
        state.isLoading = true
        state.error = nil
        
        do {
          let heroes = try await fetchHeroes()
          state.heroes = heroes
          state.allHeroes = heroes
          state.isLoading = false
        } catch {
          state.error = error.localizedDescription
          state.isLoading = false
        }
        
      case .searchHeroes(let query):
        searchQuery = query
        if query.isEmpty {
          applyFilter(category: selectedCategory)
        } else {
          state.heroes = state.allHeroes.filter { hero in
            hero.name.localizedCaseInsensitiveContains(query) ||
            (hero.biography.fullName.localizedCaseInsensitiveContains(query) && !hero.biography.fullName.isEmpty)
          }
        }
        
      case .filterHeroes(let category):
        if selectedCategory == category {
          selectedCategory = .all
        } else {
          selectedCategory = category
        }
        applyFilter(category: selectedCategory)
        searchQuery = ""
    }
  }
  
  //MARK: - Data
  private func fetchHeroes() async throws -> [Hero] {
    if let heroes = await cacheService.loadCache(key: .hero, as: [Hero].self) {
      return heroes
    } else {
      let heroes = try await loadHeroesFromNetwork()
      await saveToCache(heroes: heroes)
      return heroes
    }
  }
  
  private func loadHeroesFromNetwork() async throws -> [Hero] {
    guard let url = URL(string: Constants.APIHost) else {
      throw NetworkError.invalidURL
    }
    
    let response: [Hero] = try await networkService.fetchData(from: url)
    let heroes = response.filter { $0.biography.publisher == "Marvel Comics"}
    return heroes
  }
  
  private func saveToCache(heroes: [Hero]) async {
    await cacheService.saveCache(heroes, key: .hero)
  }
  
  //MARK: - Filtering Logic
  private func applyFilter(category: HeroCategory) {
    switch category {
      case .all:
        state.heroes = state.allHeroes
      case .good:
        state.heroes = state.allHeroes.filter { $0.biography.alignment?.lowercased() == "good" }
      case .bad:
        state.heroes = state.allHeroes.filter { $0.biography.alignment?.lowercased() == "bad" }
      case .anti:
        state.heroes = state.allHeroes.filter {
          let alignment = $0.biography.alignment?.lowercased()
          return alignment != "good" && alignment != "bad" && alignment != nil
        }
      case .alien:
        state.heroes = state.allHeroes.filter { $0.appearance.race?.lowercased().contains("alien") == true }
      case .human:
        state.heroes = state.allHeroes.filter { $0.appearance.race?.lowercased().contains("human") == true }
    }
  }
  
  //MARK: - Error Handling
  func clearEror() {
    state.error = nil
  }
}



