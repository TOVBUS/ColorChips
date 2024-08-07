//
//  MemberViewModel.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/7/24.
//

import SwiftUI
import Alamofire

@MainActor
class MemberViewModel: ObservableObject {
    @Published var member: Member?
    @Published var memberID: MemberIDFromAppleID?
    @Published var errorMessage: String?

    func createMember(_ member: MemberCreateWithAppleID) async {
        let url = "\(Config.baseURL)/member/apple-login"

        // Apple ID를 헤더에 포함시키기 위해 필요
        guard let appleID = member.appleID else {
            self.errorMessage = "Apple ID가 필요합니다."
            return
        }

        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "appleID": appleID
        ]

        do {
            let request = AF.request(url, method: .post, headers: headers)

            let response = try await request.serializingDecodable(LoginResponse.self).response

            switch response.result {
            case .success(let loginResponse):
                print("JWT 토큰: \(loginResponse.token)")
                // 받은 토큰을 저장하거나, 다음 작업을 수행합니다.
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print("Error creating member: \(error)")
            }
        } catch {
            self.errorMessage = error.localizedDescription
            print("Error creating member: \(error)")
        }
    }

    func updateMember(_ member: Member) async {
        do {
            let updatedMember: Member = try await NetworkManager.fetch("/member/\(member.id)", method: .patch, body: member)
            self.member = updatedMember
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func findOneMember(memberId: Int) async {
        do {
            let foundMember: Member = try await NetworkManager.fetch("/member/\(memberId)", method: .get)
            self.member = foundMember
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func deleteMember(memberId: Int) async {
        do {
            _ = try await NetworkManager.fetch("/member/\(memberId)", method: .delete) as EmptyResponse
            self.member = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func findOneMemberID(appleID: String) async {
        do {
            let id: MemberIDFromAppleID = try await NetworkManager.fetch("/member/apple/\(appleID)", method: .get)
            self.memberID = id
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
