//
//  MemberUseCase.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import SwiftUI

//class MemberUseCase {
//    private let repository: MemberRepositoryProtocol
//    
//    init(repository: MemberRepositoryProtocol = MemberRepository()) {
//        self.repository = repository
//    }
//    
//    func createMember(_ member: CreateMemberDto, imageData: Data?) async throws -> Member {
//        return try await repository.createMember(member, imageData: imageData)
//    }
//    
//    func getMember(id: Int) async throws -> Member {
//        return try await repository.getMember(id: id)
//    }
//    
//    func updateMember(id: Int, member: Member) async throws -> Member {
//        return try await repository.updateMember(id: id, member: member)
//    }
//    
//    func deleteMember(id: Int) async throws {
//        try await repository.deleteMember(id: id)
//    }
//}
