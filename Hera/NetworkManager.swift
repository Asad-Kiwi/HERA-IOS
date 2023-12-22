import Foundation
import Alamofire

enum ServerErrorCodes: Int {
    case unknown = 0
    case emptyResponse
    case decodingFailed
    case unserialized
    // Add more error codes as needed
}

struct ServerError: Error {
    let message: String
    let code: ServerErrorCodes
    let args: [String]
}
struct ErrorMessage: Codable {
    let message: String
}
class ApiManager: ObservableObject {
    @Published var isLoading: Bool = false
    // Define a singleton instance
    static let shared = ApiManager()
  
    // Private initializer to ensure singleton pattern
    private init() {}
    
    // Common function for making API requests
    func request(
        url: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<[String: Any], ServerError>) -> Void
    ) {
        isLoading = true
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { [weak self] response in
                guard let self = self else { return }

                switch response.result {
                    
                case .success(let json):
                    self.isLoading = false
                    if let jsonDict = json as? [String: Any] {
                        completion(.success(jsonDict))
                    } else {
                        let error = AFError.responseSerializationFailed(reason: .decodingFailed(error: DecodingError.typeMismatch(Any.self, DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Dictionary but found \(type(of: json)) instead.", underlyingError: nil))))
                        print("underlyingError: \(error)")
                        completion(.failure(self.createServerError(response: response.response, error: error, data: response.data)))
                    }
                    
                case .failure(let error):
                    self.isLoading = false
                    let serverError = self.createServerError(response: response.response, error: error, data: response.data)
                    print("ErrorInAlmofire: \(serverError.message)")
                     var showToast = false
                    completion(.failure(serverError))
                }
            }
    }
    
    private func createServerError(response: HTTPURLResponse?, error: AFError, data: Data?) -> ServerError {
          guard let serverResponse = response else {
              return ServerError(message: "Unknown error", code: .unknown, args: [error.localizedDescription])
          }

          guard let serverData = data else {
              return ServerError(message: "Empty response", code: .emptyResponse, args: [error.localizedDescription])
          }

          let responseCode: ServerErrorCodes

          if let code = ServerErrorCodes(rawValue: serverResponse.statusCode) {
              responseCode = code
          } else {
              responseCode = .unknown
          }

          do {
              let serverMessage = try JSONDecoder().decode(ErrorMessage.self, from: serverData)
              return ServerError(message: serverMessage.message, code: responseCode, args: [])
          } catch (let decodingError) {
              return ServerError(message: "Body not serializable", code: .unserialized, args: [String(data: serverData, encoding: .utf8) ?? "", decodingError.localizedDescription])
          }
      }
}
