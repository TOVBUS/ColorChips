//
//  HistoryViewModel.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import SwiftUI
import Alamofire

@MainActor
class HistoryViewModel: ObservableObject {
    @Published var histories: [History] = []
    @Published var errorMessage: String?
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    //    func createHistory(memberID: Int, createHistoryDto: CreateHistoryDto) async {
    //        do {
    //            let historyResponse: HistoryResponse = try await NetworkManager.fetch("/member/\(memberID)/history", method: .post, body: createHistoryDto)
    //        } catch {
    //            self.errorMessage = error.localizedDescription
    //            print("Error creating history: \(error)")
    //        }
    //    }
    
    func createHistory(memberID: Int, createHistoryDto: CreateHistoryDto) async {
        let url = "\(Config.baseURL)/member/\(memberID)/history"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(dateFormatter)
            let jsonData = try encoder.encode(createHistoryDto)
            request.httpBody = jsonData
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                throw URLError(.badServerResponse)
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let historyResponse = try decoder.decode(HistoryResponse.self, from: data)
            print("Created history response: \(historyResponse)")
        } catch {
            self.errorMessage = error.localizedDescription
            print("Error creating history: \(error)")
        }
    }
    
    func findAllHistories(memberId: Int) async {
        do {
            let allHistories: [History] = try await NetworkManager.fetch("/member/\(memberId)/history", method: .get)
            histories = allHistories
        } catch {
            errorMessage = error.localizedDescription
            print("Error fetching histories: \(error)")
        }
    }
}
