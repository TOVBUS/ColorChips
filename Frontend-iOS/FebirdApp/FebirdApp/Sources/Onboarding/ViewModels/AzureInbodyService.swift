//
//  AzureInbodyNetService.swift
//  FebirdApp
//
//  Created by 이유경 on 8/8/24.
//

import Foundation
import Alamofire

class AzureInbodyService: ObservableObject {
    private var subscriptionKey: String = "9ac5258525594353a9852e94af9f2ab6"

    // MARK: - 이미지 분석
    func analyzeImage(imageData: Data, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "https://doc-feo.cognitiveservices.azure.com/formrecognizer/documentModels/feo-inbody-model2:analyze?api-version=2023-07-31"
        let headers: HTTPHeaders = [
            "Ocp-Apim-Subscription-Key": subscriptionKey,
            "Content-Type": "application/octet-stream"
        ]

        AF.upload(imageData, to: url, headers: headers)
            .response { response in
                debugPrint(response)

                if let httpResponse = response.response,
                   let operationLocation = httpResponse.headers["Operation-Location"] {
                    completion(.success(operationLocation))
                } else {
                    print("network af.upload 메서드에서 문제발생! analyzeImage 메서드임")
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Operation-Location header not found."])))
                }
            }
    }
    // MARK: - 이미지 분석 결과
    func getAnalyzeResult(operationLocation: String, completion: @escaping (Result<InbodyRoot, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Ocp-Apim-Subscription-Key": subscriptionKey
        ]

        AF.request(operationLocation, headers: headers)
            .responseDecodable(of: InbodyRoot.self) { response in
                debugPrint(response)

                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    print("network af.request 메서드에서 문제발생! getAnalyzeResult 메서드임")
                    if let data = response.data, let str = String(data: data, encoding: .utf8) {
                        print("Response data: \(str)")
                    }
                    completion(.failure(error))
                }
            }
    }
}
