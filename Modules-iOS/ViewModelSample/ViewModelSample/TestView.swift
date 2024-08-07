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
//                        await testInbodyViewModel()
//                        await testExerciseViewModel()
//                        await testHistoryViewModel()
//                        await testLevelViewModel()
//                        await testRoutineViewModel()
                        await testMemberViewModel()
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
        
        // Create History ✅
        let newHistory = CreateHistoryDto(achievementDate: Date())
        await historyViewModel.createHistory(memberID: 27, createHistoryDto: newHistory)
        print("Histories after creation: \(historyViewModel.histories)")
    }
    
    private func testLevelViewModel() async {
        // FindAll Level ✅
        await levelViewModel.findAllLevels()
        print("Levels: \(levelViewModel.levels)")
        
        // FindOne Level ✅
        await levelViewModel.findOneLevel(levelId: 3)
        print("Level: \(String(describing: levelViewModel.level))")
    }
    
    private func testRoutineViewModel() async {
        // FindAll Routine ✅
        await routineViewModel.findAllRoutines()
        print("Routines: \(routineViewModel.routines)")
        
        // FindOne Routine ✅
        await routineViewModel.findOneRoutine(routineId: 1003)
        print("Routine: \(String(describing: routineViewModel.routine))")
    }
    
    private func testMemberViewModel() async {
        // Apple-login Member(Create Member) ✅
        await memberViewModel.createMember(MemberCreateWithAppleID(appleID: "testdy"))
        
        // Update Member ✅
        await memberViewModel.updateMember(Member(id: 27, age: 22, nickname: "테스트중", profileImage: "dddd.png", gender: "male", appleID: "test", kakaoID: "없어용", currentLevel: 3))
        print("Member after creation: \(memberViewModel.member)")
        
        // FindOne Member ✅
        await memberViewModel.findOneMember(memberId: 27)
        print("Member after findOne: \(memberViewModel.member)")
        
        // Delete Member ✅
        await memberViewModel.deleteMember(memberId: 16)
        print("Member after delete: \(memberViewModel.member)")
    }
}


#Preview {
    TestView()
}
