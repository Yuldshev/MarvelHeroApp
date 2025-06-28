import XCTest
@testable import Marvel_Hero

//MARK: - Mock Network
class MockNetworkService: NetworkProtocol {
  var shouldThrowError: Bool = false
  var mockHeroes: [Hero] = []
  
  func fetchData<T>(from url: URL) async throws -> T where T : Decodable {
    if shouldThrowError {
      throw NetworkError.invalidResponse
    }
    return mockHeroes as! T
  }
}

//MARK: - Mock Cache
class MockCacheService: CacheProtocol {
  var shouldReturnCachedData: Bool = false
  var cachedHeroes: [Hero]?
  
  func saveCache<T>(_ data: T, key: Marvel_Hero.CacheKey) async where T : Encodable {
  }
  
  func loadCache<T>(key: CacheKey, as type: T.Type) async -> T? where T : Decodable {
    if shouldReturnCachedData {
      return cachedHeroes as? T
    }
    return nil
  }
  
  func removeCache(for: CacheKey) async {
  }
  
  func clearAllCache() async {
  }
}

//MARK: - HeroStore tests
final class HeroStoreTests: XCTestCase {
  var sut: HeroStore!
  var mockNetwork: MockNetworkService!
  var mockCache: MockCacheService!
  
  @MainActor
  override func setUpWithError() throws {
    mockNetwork = MockNetworkService()
    mockCache = MockCacheService()
    sut = HeroStore(service: mockNetwork, cache: mockCache)
    
    mockNetwork.mockHeroes = mockHeroes
    
    let expectation = XCTestExpectation(description: "Waiting for network to complete")
    Task { @MainActor in
      await sut.dispatch(intent: .loadHeroes)
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 5.0)
  }
  
  override func tearDownWithError() throws {
    sut = nil
    mockNetwork = nil
    mockCache = nil
  }
  
  //MARK: - Fetch testing
  @MainActor
  func test_loadHeroes_fetchesFromNetworkWhenCacheIsEmpty() async throws {
    mockCache.shouldReturnCachedData = false
    
    await sut.dispatch(intent: .loadHeroes)
    
    XCTAssertFalse(sut.state.isLoading)
    XCTAssertNil(sut.state.error)
    XCTAssertEqual(sut.state.heroes, mockNetwork.mockHeroes)
    XCTAssertEqual(sut.state.allHeroes, mockNetwork.mockHeroes)
  }
  
  @MainActor
  func test_loadHeroes_loadsFromCacheWhenAvailable() async throws {
    let cachedHeroes = mockHeroes
    mockCache.shouldReturnCachedData = true
    mockCache.cachedHeroes = cachedHeroes
    
    await sut.dispatch(intent: .loadHeroes)
    
    XCTAssertFalse(sut.state.isLoading)
    XCTAssertNil(sut.state.error)
    XCTAssertEqual(sut.state.heroes, cachedHeroes)
    XCTAssertEqual(sut.state.allHeroes, cachedHeroes)
  }
  
  @MainActor
  func test_loadHeroes_handlesNetworkError() async throws {
    let newSut = HeroStore(service: mockNetwork, cache: mockCache)
    mockNetwork.shouldThrowError = true
    
    await newSut.dispatch(intent: .loadHeroes)
    
    XCTAssertFalse(newSut.state.isLoading)
    XCTAssertNotNil(newSut.state.error)
    XCTAssertTrue(newSut.state.heroes.isEmpty)
    XCTAssertTrue(newSut.state.allHeroes.isEmpty)
  }
  
  //MARK: - Search testing
  @MainActor
  func test_searchHeroes_filtersByName() async {
    await sut.dispatch(intent: .searchHeroes(query: "spider"))
    
    XCTAssertEqual(sut.state.heroes.count, 1)
    XCTAssertEqual(sut.state.heroes.first?.name, "Spider-Man")
  }
  
  @MainActor
  func test_searchHeroes_filteredByFullName() async {
    await sut.dispatch(intent: .searchHeroes(query: "tony"))
    
    XCTAssertEqual(sut.state.heroes.count, 1)
    XCTAssertEqual(sut.state.heroes.first?.name, "Iron Man")
  }
  
  @MainActor
  func test_searchHeroes_returnsAllHeroesWhenQueryIsEmpty() async {
    await sut.dispatch(intent: .searchHeroes(query: "spider"))
    await sut.dispatch(intent: .searchHeroes(query: ""))
    
    XCTAssertEqual(sut.state.heroes.count, sut.state.allHeroes.count)
  }
  
  @MainActor
  func test_filterHeroes_clearsSearchText() async {
    await sut.dispatch(intent: .searchHeroes(query: "spider"))
    XCTAssertEqual(sut.searchQuery, "spider")
    
    await sut.dispatch(intent: .filterHeroes(category: .good))
    XCTAssertEqual(sut.searchQuery, "")
  }
  
  //MARK: - Filter testing
  @MainActor
  func test_filterHeroes_byGood() async {
    await sut.dispatch(intent: .filterHeroes(category: .good))
    
    XCTAssertEqual(sut.state.heroes.count, 2)
    XCTAssertTrue(sut.state.heroes.allSatisfy { $0.biography.alignment?.lowercased() == "good"})
    XCTAssertEqual(sut.selectedCategory, .good)
  }
  
  @MainActor
  func test_filterHeroes_byRace() async {
    await sut.dispatch(intent: .filterHeroes(category: .human))
    
    XCTAssertEqual(sut.state.heroes.count, 2)
    XCTAssertTrue(sut.state.heroes.allSatisfy { $0.appearance.race?.lowercased().contains("human") == true })
    XCTAssertEqual(sut.selectedCategory, .human)
  }
  
  @MainActor
  func test_filterHeroes_resetsToAllWhenSameCategoryTappedTwice() async {
    await sut.dispatch(intent: .filterHeroes(category: .good))
    XCTAssertEqual(sut.state.heroes.count, 2)
    XCTAssertEqual(sut.selectedCategory, .good)
    
    await sut.dispatch(intent: .filterHeroes(category: .good))
    XCTAssertEqual(sut.state.heroes.count, sut.state.allHeroes.count)
    XCTAssertEqual(sut.selectedCategory, .all)
  }
  
  @MainActor
  func test_filterHeroes_changesCategoryWhenDifferentCategoryTapped() async {
    await sut.dispatch(intent: .filterHeroes(category: .good))
    XCTAssertEqual(sut.selectedCategory, .good)
    
    await sut.dispatch(intent: .filterHeroes(category: .bad))
    XCTAssertEqual(sut.selectedCategory, .bad)
    XCTAssertEqual(sut.state.heroes.count, 0)
  }
}
