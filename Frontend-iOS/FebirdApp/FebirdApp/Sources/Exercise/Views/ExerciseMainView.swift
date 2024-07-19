//
//  ExerciseMainView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/18/24.
//

import SwiftUI

struct ExerciseMainView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .ignoresSafeArea()
            
            VStack {
                ExerciseMainHeaderView()
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 32) {
                    HStack(alignment: .center) {
                        Text("운동 목록")
                            .font(.customFont(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.08))
                        Spacer()
                    }
                    .padding(24)
                    
                    VStack {
                        VStack(alignment: .center, spacing: 8) {
                            Text("스모 스쿼트")
                                .font(.customFont(size: 14, weight: .bold))
                                .foregroundColor(.gray30)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            
                            Text("3ea * 3set")
                                .font(.customFont(size: 14, weight: .regular))
                                .foregroundColor(.gray30)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.gray10)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                    }
                }
                
                CustomButtonView(title: "운동 시작하기")
                
                CustomTabBarView()
            }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ExerciseMainView()
        .preferredColorScheme(.dark)
}
