//
//  CustomCell.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct CustomCell: View {
    var showDesc: Bool
    var showChevron: Bool
    var showArrow: Bool
    var showToggle: Bool
    var showVersion: Bool
    var text: String = "프로필"
    @State private var isExpanded: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading) {
                Text(text)
                if showDesc {
                    Text("허용 후부터 인바디로 측정된 데이터의 일부를 가져옵니다.")
                        .font(.customFont(size: 14, weight: .regular))
                        .foregroundColor(.gray60)
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                }
            }
            Spacer()
            if showChevron {
                Image("Chevron-right")
            }

            if showArrow {
                Image("arrow_right")
            }

            if showToggle {
               Toggle(isOn: $isExpanded, label: {})
                    .toggleStyle(CustomToggle())
            }

            if showVersion {
                Text("1.0.0")
                    .font(.customFont(size: 14, weight: .medium))
                    .foregroundStyle(.gray30)
            }
        }
        .padding(20)
        .frame(maxWidth: 344, maxHeight: (showDesc ? 120 : 55))
        .background(.gray10)
        .cornerRadius(20)
    }
}

#Preview {
    CustomCell(showDesc: true, showChevron: false, showArrow: false, showToggle: true, showVersion: false, text: "애플 헬스 연동")
}
