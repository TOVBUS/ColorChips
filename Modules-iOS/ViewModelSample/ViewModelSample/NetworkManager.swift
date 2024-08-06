//
//  NetworkManager.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
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
    static func fetch<T: Codable>(_ url: String, method: HTTPMethod = .get, body: T? = nil, multipartData: [String: Data]? = nil) async throws -> T {
        guard let requestURL = URL(string: url) else {
            throw NetworkError.invalidURL
        }

        let headers: HTTPHeaders = [
            "Content-Type": "multipart/form-data"
        ]
        
        let response: AFDataResponse<Data>
        
        if let multipartData = multipartData {
            response = await AF.upload(multipartFormData: { multipartFormData in
                for (key, value) in multipartData {
                    multipartFormData.append(value, withName: key)
                }
                if let body = body {
                    let jsonData = try? JSONEncoder().encode(body)
                    multipartFormData.append(jsonData ?? Data(), withName: "json")
                }
            }, to: requestURL, method: Alamofire.HTTPMethod(rawValue: method.rawValue), headers: headers).serializingData().response
        } else {
            response = await AF.request(requestURL,
                                        method: Alamofire.HTTPMethod(rawValue: method.rawValue),
                                        parameters: body,
                                        encoder: JSONParameterEncoder.default,
                                        headers: headers).serializingData().response
        }

        print("Response Data: \(String(data: response.data ?? Data(), encoding: .utf8) ?? "No Data")")
        
        switch response.result {
        case .success(let data):
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        case .failure(let error):
            if let data = response.data {
                do {
                    let decodedError = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    print("Decoded Error: \(decodedError.message)")
                } catch {
                    print("Failed to decode error response: \(error)")
                }
            }
            throw NetworkError.decodingFailed(error)
        }
    }
}

// 에러 응답 구조체 정의
struct ErrorResponse: Codable {
    let message: String
}
