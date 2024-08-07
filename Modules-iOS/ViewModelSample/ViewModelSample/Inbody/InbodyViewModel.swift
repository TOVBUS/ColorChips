//
//  InbodyViewModel.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/6/24.
//

import SwiftUI
import Alamofire

@MainActor
class InbodyViewModel: ObservableObject {
    @Published var inbodies: [Inbody] = []
    @Published var createdInbody: InbodyResponse?
    @Published var errorMessage: String?
    
    func findAllInbodies(memberId: Int = 15) async {
        do {
            let inbodies = try await NetworkManager.fetchInbodies(memberId: memberId)
            self.inbodies = inbodies
        } catch {
            self.errorMessage = error.localizedDescription
            print("Error fetching inbodies: \(error)")
        }
    }
    
    func createInbody(createInbodyDto: CreateInbodyDto = CreateInbodyDto(height: 157.2, weight: 56.2, inbodyDate: Date(), bmr: 31.2, bodyfat: 29.1, bmi: 21.3, memberID: 27)) async {
        do {
            let inbodies = try await NetworkManager.createInbody(createInbodyDto: createInbodyDto)
            self.createdInbody = inbodies
        } catch {
            self.errorMessage = error.localizedDescription
            print("Error fetching inbodies: \(error)")
        }
    }
}
