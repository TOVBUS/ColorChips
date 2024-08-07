//
//  NetworkManager.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/5/24.
//

import Foundation
import Alamofire

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingFailed(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .requestFailed:
            return "The network request failed."
        case .decodingFailed(let error):
            return "Decoding the response failed: \(error.localizedDescription)"
        }
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

class NetworkManager {
    static func fetch<T: Codable>(_ endpoint: String, method: HTTPMethod = .get, body: T? = nil, multipartData: [String: Data]? = nil) async throws -> T {
        let requestURL = URL(string: Config.baseURL + endpoint)!

        return try await withCheckedThrowingContinuation { continuation in
            let request: DataRequest
            if let multipartData = multipartData {
                request = AF.upload(multipartFormData: { multipartFormData in
                    for (key, value) in multipartData {
                        multipartFormData.append(value, withName: key)
                    }
                }, to: requestURL)
            } else {
                request = AF.request(requestURL,
                                     method: Alamofire.HTTPMethod(rawValue: method.rawValue),
                                     parameters: body,
                                     encoder: JSONParameterEncoder.default)
            }

            request.responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

extension JSONDecoder {
    static var iso8601: JSONDecoder {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }
}

struct EmptyResponse: Codable {}
