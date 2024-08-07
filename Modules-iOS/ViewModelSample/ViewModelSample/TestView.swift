//
//  TestView.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/6/24.
//

import SwiftUI
import Alamofire

struct TestView: View {
    @StateObject private var inbodyViewModel = InbodyViewModel()
    @StateObject private var exerciseViewModel = ExerciseViewModel()
    @StateObject private var levelViewModel = LevelViewModel()
    @StateObject private var routineViewModel = RoutineViewModel()
    @StateObject private var historyViewModel = HistoryViewModel()
    @StateObject private var memberViewModel = MemberViewModel()
    
    var body: some View {
        VStack {
            Text("Fetching data...")
                .onAppear {
                    Task {
                        await testInbodyViewModel()
                        await testExerciseViewModel()
                        await testHistoryViewModel()
//                        await testLevelViewModel()
//                        await testRoutineViewModel()
//                        await testMemberViewModel()
                    }
                }
        }
    }

    private func testInbodyViewModel() async {
        // Create Inbody ✅
        await inbodyViewModel.createInbody()
        print("created inbody: \(inbodyViewModel.createdInbody)")
        
        // FindAll Inbody ✅
        await inbodyViewModel.findAllInbodies(memberId: 27)
        print("get inbodies: \(inbodyViewModel.inbodies)")
    }
    
    private func testExerciseViewModel() async {
        // FindAll Exercise ✅
        await exerciseViewModel.findAllExercises()
        print("Exercises: \(exerciseViewModel.exercises)")
        
        // FindOne Exercise ✅
        await exerciseViewModel.findOneExercise(id: 80212) // 운동 아이디
        print("Exercise (1): \(exerciseViewModel.exercise)")
    }
    
    private func testHistoryViewModel() async {
        // FindAll History ✅
        await historyViewModel.findAllHistories(memberId: 27)
        print("Histories: \(historyViewModel.histories)")
        
        // Create History ❌
        let newHistory = CreateHistoryDto(achievementDate: Date())
        await historyViewModel.createHistory(memberID: 27, createHistoryDto: newHistory)
        print("Histories after creation: \(historyViewModel.histories)")
    }
    
    private func testLevelViewModel() async {
        await levelViewModel.findAllLevels()
        print("Levels: \(levelViewModel.levels)")
        
        await levelViewModel.findOneLevel(levelId: 80212)
        print("Level: \(String(describing: levelViewModel.level))")
    }
    
    private func testRoutineViewModel() async {
        await routineViewModel.findAllRoutines()
        print("Routines: \(routineViewModel.routines)")
        
        await routineViewModel.findOneRoutine(routineId: 1)
        print("Routine: \(String(describing: routineViewModel.routine))")
    }
    
    
    /*
    private func testMemberViewModel() async {
        let newMember = Member(id: nil, name: "John Doe", email: "john.doe@example.com", age: 30, height: 175, weight: 70, gender: "Male")
        await memberViewModel.createMember(newMember)
        print("Member: \(String(describing: memberViewModel.member))")
        
        if let member = memberViewModel.member {
            var updatedMember = member
            updatedMember.weight = 72
            await memberViewModel.updateMember(updatedMember)
            print("Updated Member: \(String(describing: memberViewModel.member))")
            
            await memberViewModel.findOneMember(memberId: member.id ?? 0)
            print("Found Member: \(String(describing: memberViewModel.member))")
            
            await memberViewModel.deleteMember(memberId: member.id ?? 0)
            print("Deleted Member: \(String(describing: memberViewModel.member))")
        }
    }
     */
    /*
    private func inbodyGetAllTest() {
        AF.request("\(Config.baseURL)/member/15/inbody").responseDecodable(of: [Inbody].self) { response in
            switch response.result {
            case .success(let inbodies):
                print(inbodies)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
     */
}


#Preview {
    TestView()
}
