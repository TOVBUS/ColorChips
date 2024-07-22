//
//  LoginView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/22/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(.orange50)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("피오피트에 오신것을 환영합니다🎉")
                    .font(.customFont(size: 24, weight: .bold))
                
                Text("그동안 혼자 운동하다가\n잘못된 자세로 인해 다친적이 있나요?")
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 100)
                    .font(.customFont(size: 16, weight: .regular))
                
                Text("또, 3일 이상 해야지! 마음먹고\n금방 포기하게 되지는 않았나요?")
                    .multilineTextAlignment(.trailing)
                    .padding(.leading, 100)
                    .font(.customFont(size: 16, weight: .regular))
                
                Text("앞으로는 피오코치가 \n올바른 자세로, 꾸준히 할 수 있도록 도와줄게요!")
                    .font(.customFont(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    .multilineTextAlignment(.center)
                
                Image("peoLogo")
                    .resizable()
                    .frame(width: 204, height: 204)
                    .padding(.top, -20)
                    .padding(.bottom, 50)
                
                // MARK: - 로그인 버튼
                Button(action: {
                    // TODO: 카카오 로그인 연결
                }, label: {
                    HStack(spacing: 5) {
                        Image("kakao-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23, height: 20)
                        Text("카카오로 시작하기")
                    }
                    .foregroundStyle(Color(red: 0.24, green: 0.12, blue: 0.12))
                    .font(.customFont(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.99, green: 0.9, blue: 0.02))
                            .padding(.horizontal, 24)
                    )
                })
                .padding(0)
                
                Button(action: {
                    // TODO: 애플 로그인 연결
                }, label: {
                    HStack(spacing: 5) {
                        Image("apple-icon")
                            .frame(width: 24, height: 29)
                        Text("애플로 시작하기")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .font(.customFont(size: 16, weight: .semibold))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray100)
                            .padding(.horizontal, 24)
                    )
                })
                .padding(0)
            }
            .foregroundStyle(.white)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
