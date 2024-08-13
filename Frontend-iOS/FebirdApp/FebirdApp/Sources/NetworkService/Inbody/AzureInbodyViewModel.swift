//
//  AzureInbodyViewModel.swift
//  FebirdApp
//
//  Created by 이유경 on 8/13/24.
//

import Foundation
import Alamofire
import UIKit

enum AnalyzeError: Error {
    case networkError
    case imageProcessingError
    case dataParsingError
    case notFoundInbodyData
    case localizedDescription

    var errorName: String {
        switch self {
        case .networkError: return "network error"
        case .dataParsingError: return "data parsing error"
        case .imageProcessingError: return "image processing error"
        case .notFoundInbodyData: return "not found inbody data"
        case .localizedDescription: return "localizedDescription"
        }
    }
}

class AzureInbodyViewModel: ObservableObject {
    //    @Published var inbodyData: AzureInbody?
    @Published var status: String = ""
    @Published var weight: Weights?
    @Published var bmr: Bmr?
    @Published var bmi: Bmi?
    @Published var bodyFat: BodyFat?
    @Published var inbodyDate: InbodyDate?
    @Published var isLoading: Bool = false
    @Published var error: AnalyzeError?

    private let service = AzureInbodyService()
    // MARK: - 이미지 분석
    func analyzeImage(_ image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            self.error = .imageProcessingError
            return
        }

        isLoading = true
        error = nil

        service.analyzeImage(imageData: imageData) { [weak self] result in
            switch result {
            case .success(let operationLocation):
//                self?.isLoading = false
                self?.getAnalyzeResult(operationLocation: operationLocation)
            case .failure:
                DispatchQueue.main.async {
                    self?.error = .networkError
                    self?.isLoading = false
                }
            }
        }
    }
    // MARK: - 이미지 분석 결과 저장
    private func getAnalyzeResult(operationLocation: String) {
        func poll() {
            service.getAnalyzeResult(operationLocation: operationLocation) { [weak self] result in
                switch result {
                case .success(let inbodyRoot):
                    if inbodyRoot.status == "succeeded" {
                        DispatchQueue.main.async {
                            self?.isLoading = false
                            if let document = inbodyRoot.analyzeResult?.documents[0].fields {
                                self?.status = inbodyRoot.status
                                self?.bmi = document.bmi
                                self?.weight = document.weight
                                self?.bmr = document.bmr
                                self?.bodyFat = document.bodyFat
                                self?.inbodyDate = document.inbodyDate
                            } else {
                                self?.error = .notFoundInbodyData
                            }
                        }
                    } else if inbodyRoot.status == "running" {
                        // 아직 분석 중이므로 3초 후에 다시 확인
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            poll()
                        }
                    } else {
                        // 예상치 못한 상태
                        DispatchQueue.main.async {
//                            self?.isLoading = false
                            self?.error = .dataParsingError
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
//                        self?.isLoading = false
                        self?.error = .networkError
                        print(error.localizedDescription)
                    }
                }
            }
        }

        poll() // 첫 번째 폴링 시작
    }
}
