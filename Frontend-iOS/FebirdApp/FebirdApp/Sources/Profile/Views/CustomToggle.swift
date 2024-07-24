//
//  CustomToggle.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

// MARK: - 토글 커스텀
struct CustomToggle: ToggleStyle {
    private let width = 60.0

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 56, height: 28)
                    .foregroundColor(configuration.isOn ? .orange50 : .gray20)

                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 24, height: 24)
                    .padding(4)
                    .foregroundColor(.white)
                    .shadow(color: Color(red: 0.07, green: 0.07, blue: 0.07).opacity(0.35), radius: 4, x: 0, y: 4)

                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                    }
            }
        }
    }
}
