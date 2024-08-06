//
//  SocialLoginView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 8/1/24.
//

import SwiftUI

struct SocialLoginView: View {
    var body: some View {
        ZStack {
            Color.orange50.ignoresSafeArea()

            VStack(spacing: 20) {
                Text("피오피트에 오신것을 환영합니다🎉")
                    .font(.customFont(size: 24, weight: .bold))
                    .padding(.top, 50)

                Text("그동안 혼자 운동하다가\n잘못된 자세로 인해 다친적이 있나요?")
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 100)
                    .font(.customFont(size: 16, weight: .regular))
                    .fixedSize(horizontal: false, vertical: true)

                Text("또, 3일 이상 해야지! 마음먹고\n금방 포기하게 되지는 않았나요?")
                    .multilineTextAlignment(.trailing)
                    .padding(.leading, 100)
                    .font(.customFont(size: 16, weight: .regular))
                    .fixedSize(horizontal: false, vertical: true)

                Text("앞으로는 피오코치가 \n올바른 자세로, 꾸준히 할 수 있도록 도와줄게요!")
                    .font(.customFont(size: 18, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer()

                Image("peoLogo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 15)

                CustomButtonView(title: "Apple Sign In") {
                    // TODO: 로그인 로직 추가
                }.padding(.top, 40)

                Button(action: {
                    // TODO: 서비스 이용약관으로 넘어감
                }, label: {
                    VStack {
                        Text("가입 시, FeoFit의 다음 사항에 동의하는 것으로 간주합니다.")
                        Text("서비스 이용약관 및 개인정보 정책")
                    }
                    .font(.customFont(size: 12, weight: .regular))
                    .padding(.top)
                })
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    SocialLoginView()
}
