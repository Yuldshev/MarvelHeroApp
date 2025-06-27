import Foundation

enum NetworkError: Error, LocalizedError {
  case invalidURL
  case invalidResponse
  case statusCode(Int)
  case decodingError(Error)
  case unknown(Error)
  
  var errorDescription: String? {
    switch self {
      case .invalidURL:
        return "The URL provided was invalid."
      case .invalidResponse:
        return "The server response was not valid."
      case .statusCode(let code):
        return "Request failed with status code: \(code)."
      case .decodingError(let error):
        return "Failed to decode the response: \(error.localizedDescription)"
      case .unknown(let error):
        return "An unknown error occurred: \(error.localizedDescription)"
    }
  }
}

