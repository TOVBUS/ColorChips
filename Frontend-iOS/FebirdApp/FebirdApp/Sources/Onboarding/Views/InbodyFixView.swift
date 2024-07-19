//
//  InbodyFixView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/18/24.
//

import SwiftUI

struct InbodyFixView: View {
//    @State private var weight: String
    var body: some View {
        ScrollView {
            OnboardingGaugeView(progress: 7)
            Text("정보가 다르게 인식됐나요? \n여기에서 수정할 수 있어요 😉")
                .font(.customFont(size: 20, weight: .bold))
                .foregroundStyle(Color(red: 0.07, green: 0.07, blue: 0.08))
        }
    }
}

#Preview {
    InbodyFixView()
}
