//
//  ProfileSettingViewModel.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/4/24.
//

import SwiftUI
import SwiftData

class ProfileSettingViewModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var isFocused: Bool = false
    @Published var age: String = "16"
    @Published var gender: UserProfile.Gender = .female

    func saveProfile() {
        // TODO: SwiftData로 프로필 정보 저장하고 ViewModel의 상태를 업데이트
    }

    func loadProfile() {
        // TODO: SwiftData에서 프로필 정보를 불러와 ViewModel의 상태를 업데이트
        // 1. modelContext를 사용하여 UserProfile 데이터를 쿼리
        // 2. 데이터가 있으면 ViewModel의 상태(nickname, age, gender)를 업데이트
        // 3. 데이터가 없으면 기본값 유지
    }

    func updateProfile() {
        // TODO: 기존 프로필 정보를 업데이트
        // 1. modelContext를 사용하여 현재 UserProfile 데이터를 찾기
        // 2. 찾은 데이터를 새로운 정보로 업데이트
        // 3. modelContext.save() 호출하여 변경사항 저장
    }

    func deleteProfile() {
        // TODO: 프로필 정보 삭제 (회원 탈퇴)
        // 1. modelContext를 사용하여 현재 UserProfile 데이터를 찾기
        // 2. 찾은 데이터를 modelContext.delete()를 사용하여 삭제
        // 3. modelContext.save() 호출하여 변경사항 저장
        // 4. 관련된 다른 데이터(예: 인증 정보)도 함께 삭제해야 할 수 있음
    }

    func login() {
        // TODO: 로그인 로직 구현
        // 1. 사용자 인증 정보 확인 (예: 서버 API 호출)
        // 2. 인증 성공 시 UserDefaults나 KeyChain에 로그인 상태 저장
        // 3. 프로필 정보 로드 (loadProfile 메서드 호출)
    }

    func logout() {
        // TODO: 로그아웃 로직 구현
        // 1. UserDefaults나 KeyChain에서 로그인 상태 제거
        // 2. ViewModel의 상태 초기화
        // 3. 필요한 경우 서버에 로그아웃 요청 보내기
    }

    func register() {
        // TODO: 회원가입 로직 구현
        // 1. 입력된 정보의 유효성 검사
        // 2. 서버 API를 통해 회원가입 요청
        // 3. 성공 시 프로필 정보 저장 (saveProfile 메서드 호출)
        // 4. 자동 로그인 처리 또는 로그인 화면으로 이동
    }
}
