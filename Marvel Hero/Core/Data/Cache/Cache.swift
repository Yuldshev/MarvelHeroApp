import Foundation

protocol CacheProtocol {
  func saveCache<T: Encodable>(_ data: T, key: CacheKey) async
  func loadCache<T: Decodable>(key: CacheKey, as type: T.Type) async -> T?
  func removeCache(for key: CacheKey) async
  func clearAllCache() async
}

actor Cache: CacheProtocol {
  private let userDefaults = UserDefaults.standard
  
  func saveCache<T>(_ data: T, key: CacheKey) async where T : Encodable {
    do {
      let encoded = try JSONEncoder().encode(data)
      self.userDefaults.set(encoded, forKey: key.rawValue)
    } catch {
      return
    }
  }
  
  func loadCache<T>(key: CacheKey, as type: T.Type) async -> T? where T : Decodable {
    guard let data = userDefaults.data(forKey: key.rawValue) else { return nil }
    
    do {
      return try JSONDecoder().decode(T.self, from: data)
    } catch {
      return nil
    }
  }
  
  func removeCache(for key: CacheKey) async {
    userDefaults.removeObject(forKey: key.rawValue)
  }
  
  func clearAllCache() async {
    userDefaults.dictionaryRepresentation().keys
      .forEach { userDefaults.removeObject(forKey: $0) }
  }
}

enum CacheKey: String {
  case hero
  
  var type: Any.Type {
    switch self {
      case .hero: return [Hero].self
    }
  }
}
