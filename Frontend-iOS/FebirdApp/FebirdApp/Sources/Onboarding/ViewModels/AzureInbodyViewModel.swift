//
//  AzureInbodyViewModel.swift
//  FebirdApp
//
//  Created by 이유경 on 8/8/24.
//

import Foundation
import Alamofire

class AzureInbodyViewModel: ObservableObject {
    @Published var result: String = ""
    private let service = AzureInbodyService()

        // MARK: - 이미지 분석
    func analyzeImage(imageData: Data) {
        service.analyzeImage(imageData: imageData) { [weak self] result in
            switch result {
            case .success(let operationLocation):
                print("Operation Location: \(operationLocation)") // 디버깅 출력 추가
                self?.pollAnalyzeResult(operationLocation: operationLocation)

            case .failure(let error):
                DispatchQueue.main.async {
                    self?.result = "Error: \(error.localizedDescription)"
                    print("Error: \(error.localizedDescription)") // 디버깅 출력 추가
                }
            }
        }
    }
        // MARK: - 이미지 저장
    private func pollAnalyzeResult(operationLocation: String) {
        service.getAnalyzeResult(operationLocation: operationLocation) { [weak self] result in
            switch result {
            case .success(let analyzeResult):
                if analyzeResult.status == "succeeded" {
                    DispatchQueue.main.async {
                        if let jsonData = try? JSONEncoder().encode(analyzeResult),
                           let jsonString = String(data: jsonData, encoding: .utf8) {
                            self?.result = jsonString
                        }
                    }
                } else if analyzeResult.status == "running" {
                    // 분석이 완료되지 않은 경우 일정 시간 후 다시 요청
                    DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
                        self?.pollAnalyzeResult(operationLocation: operationLocation)
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.result = "Analysis status: \(analyzeResult.status)"
                    }
                    print("Analysis status: \(analyzeResult.status)")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.result = "Error: \(error.localizedDescription)"
                }
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
