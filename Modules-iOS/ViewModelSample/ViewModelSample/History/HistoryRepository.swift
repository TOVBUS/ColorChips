//
//  HistoryRepository.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import Foundation

protocol HistoryRepositoryProtocol {
    func createHistory(_ history: History) async throws -> History
    func getHistory(id: Int) async throws -> History
}

//class HistoryRepository: HistoryRepositoryProtocol {
//    private let baseURL = "https://app-feo.azurewebsites.net/"
//    
//    func createHistory(_ history: History) async throws -> History {
//        return try await NetworkManager.fetch(baseURL, method: .post, body: history)
//    }
//    
//    func getHistory(id: Int) async throws -> History {
//        return try await NetworkManager.fetch("\(baseURL)/member/\(id)/history", method: .get, body: History.self)
//    }
//}

