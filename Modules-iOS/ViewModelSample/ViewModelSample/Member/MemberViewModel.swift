//
//  MemberViewModel.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import SwiftUI

//class MemberViewModel: ObservableObject {
//    private let useCase: MemberUseCase
//    @Published var members: [Member] = []
//    @Published var selectedMember: Member?
//    @Published var error: Error?
//    
//    init(useCase: MemberUseCase = MemberUseCase()) {
//        self.useCase = useCase
//    }
//    
//    func createMember(_ newMember: CreateMemberDto, imageData: Data?) {
//        Task {
//            do {
//                let createdMember = try await useCase.createMember(newMember, imageData: imageData)
//                await MainActor.run {
//                    self.members.append(createdMember)
//                }
//            } catch {
//                await MainActor.run {
//                    self.error = error
//                }
//            }
//        }
//    }
//    
//    func getMember(id: Int) {
//        Task {
//            do {
//                let member = try await useCase.getMember(id: id)
//                await MainActor.run {
//                    self.selectedMember = member
//                }
//            } catch {
//                await MainActor.run {
//                    self.error = error
//                }
//            }
//        }
//    }
//    
//    func deleteMember(id: Int) {
//        Task {
//            do {
//                try await useCase.deleteMember(id: id)
//                await MainActor.run {
//                    self.members.removeAll { $0.id == id }
//                }
//            } catch {
//                await MainActor.run {
//                    self.error = error
//                }
//            }
//        }
//    }
//    
//    func updateMember(id: Int, member: Member) {
//        Task {
//            do {
//                let updatedMember = try await useCase.updateMember(id: id, member: member)
//                await MainActor.run {
//                    if let index = self.members.firstIndex(where: { $0.id == id }) {
//                        self.members[index] = updatedMember
//                    }
//                }
//            } catch {
//                await MainActor.run {
//                    self.error = error
//                }
//            }
//        }
//    }
//}
