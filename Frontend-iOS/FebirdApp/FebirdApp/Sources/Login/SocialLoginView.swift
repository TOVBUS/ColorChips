//
//  SocialLoginView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 8/1/24.
//

import SwiftUI

struct SocialLoginView: View {
    @StateObject private var loginViewModel = SocialLoginViewModel()
    @StateObject private var appleLoginViewModel = SignInWithAppleViewModel() // SignInWithAppleViewModel 추가

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

                // 애플 로그인 버튼 추가
                SignInWithAppleButton()
                    .frame(width: 280, height: 60)
                    .onTapGesture {
                        appleLoginViewModel.startSignInWithAppleFlow()
                    }
                
                // 애플 로그인 후 얻은 정보 보여주기 -> Test용 나중에 지우기

                if !appleLoginViewModel.userIdentifier.isEmpty {
                    Text("User ID: \(appleLoginViewModel.userIdentifier)")
                    Text("User Name: \(appleLoginViewModel.userName)")
                    Text("User Email: \(appleLoginViewModel.userEmail)")

                    CustomButtonView(title: "Send Apple ID to Server") {
                        loginViewModel.loginWithApple(appleID: appleLoginViewModel.userIdentifier)
                    }
                }
              
                Button(action: {
                    if let url = URL(string: "https://qsgm7ewnrc9l.sg.larksuite.com/wiki/QBgKwS3NvifpysksdIZlK8J9gvb?from=from_copylink") {
                        UIApplication.shared.open(url)
                    }
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
