//
//  MemberViewModel.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import SwiftUI

@MainActor
class MemberViewModel: ObservableObject {
    @Published var member: Member?
    @Published var errorMessage: String?
/*
    func createMember(_ member: Member) async {
        do {
            let createdMember: Member = try await NetworkManager.fetch("/member", method: .post, body: member)
            self.member = createdMember
        } catch {
            errorMessage = error.localizedDescription
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
 */
}
