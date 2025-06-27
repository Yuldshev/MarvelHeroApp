import Foundation

protocol NetworkProtocol {
  func fetchData<T: Decodable>(from url: URL) async throws -> T
}

final class Network: NetworkProtocol {
  func fetchData<T: Decodable>(from url: URL) async throws -> T {
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse else {
      throw NetworkError.invalidResponse
    }
    
    guard 200..<300 ~= httpResponse.statusCode else {
      throw NetworkError.statusCode(httpResponse.statusCode)
    }
    
    do {
      let decoded = try JSONDecoder().decode(T.self, from: data)
      return decoded
    } catch {
      throw NetworkError.decodingError(error)
    }
  }
}
