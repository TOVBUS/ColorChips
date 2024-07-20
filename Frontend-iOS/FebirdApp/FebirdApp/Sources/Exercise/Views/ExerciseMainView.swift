//
//  ExerciseMainView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/18/24.
//

import SwiftUI

struct ExerciseItem: Identifiable {
    let id = UUID()
    let name: String
    let set: String
    let isFinished: Bool
    let isStarted: Bool
}

struct ExerciseItemView: View {
    let item: ExerciseItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.name)
                .font(.customFont(size: 14, weight: .bold))
                .foregroundColor(foregroundColor)
            
            Text(item.set)
                .font(.customFont(size: 14, weight: .regular))
                .foregroundColor(foregroundColor)
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(backgroundColor)
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
    
    private var foregroundColor: Color {
        if item.isFinished {
            return .gray30
        } else if item.isStarted {
            return .orange60
        } else {
            return .gray90
        }
    }
    
    private var backgroundColor: Color {
        item.isStarted ? .orange10 : .gray10
    }
}

struct ExerciseMainView: View {
    @State private var exercises: [ExerciseItem] = [
        ExerciseItem(name: "스모 스쿼트", set: "3ea * 3set", isFinished: true, isStarted: false),
        ExerciseItem(name: "스모 스쿼트", set: "3ea * 3set", isFinished: false, isStarted: true),
        ExerciseItem(name: "스모 스쿼트", set: "3ea * 3set", isFinished: false, isStarted: false)
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .ignoresSafeArea()
            
            VStack {
                ExerciseMainHeaderView()
                
                Spacer()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(alignment: .center) {
                            Text("운동 목록")
                                .font(.customFont(size: 20, weight: .bold))
                                .foregroundColor(.gray100)
                        }
                        .padding(.horizontal, 24)
                        
                        ForEach(exercises) { exercise in
                            ExerciseItemView(item: exercise)
                        }
                    }
                    .padding(.top, 12)
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
