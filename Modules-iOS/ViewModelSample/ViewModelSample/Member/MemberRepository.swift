//
//  MemberRepository.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import Foundation

//protocol MemberRepositoryProtocol {
//    func createMember(_ member: CreateMemberDto, imageData: Data?) async throws -> Member
//    func getMember(id: Int) async throws -> Member
//    func updateMember(id: Int, member: Member) async throws -> Member
//    func deleteMember(id: Int) async throws
//}
//
//class MemberRepository: MemberRepositoryProtocol {
//    private let baseURL = "https://app-feo.azurewebsites.net/member"
//    
//    func createMember(_ member: CreateMemberDto, imageData: Data?) async throws -> Member {
//        var multipartData: [String: Data] = [:]
//        if let imageData = imageData {
//            multipartData["profile_image"] = imageData
//        }
//        return try await NetworkManager.fetch(baseURL, method: .post, body: member, multipartData: multipartData)
//    }
//    
//    func getMember(id: Int) async throws -> Member {
//        return try await NetworkManager.fetch("\(baseURL)/\(id)", method: .get, body: EmptyRequest())
//    }
//    
//    func updateMember(id: Int, member: Member) async throws -> Member {
//        return try await NetworkManager.fetch("\(baseURL)/\(id)", method: .patch, body: member)
//    }
//    
//    func deleteMember(id: Int) async throws {
//        _ = try await NetworkManager.fetch("\(baseURL)/\(id)", method: .delete, body: EmptyRequest()) as EmptyResponse
//    }
//}
