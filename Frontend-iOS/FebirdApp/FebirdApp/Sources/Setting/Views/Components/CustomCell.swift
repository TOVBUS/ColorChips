//
//  CustomCell.swift
//  FebirdApp
//
//  Created by 이유경 on 7/23/24.
//

import SwiftUI

struct CustomCell: View {

    @EnvironmentObject private var settingViewModel: SettingsViewModel
    let configuration: CellConfiguration

    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading) {
                Text(configuration.text)
                    .foregroundStyle(.gray100)

                if configuration.showDesc {
                    Text("허용 후부터 인바디로 측정된 데이터의 일부를 가져옵니다.")
                        .font(.customFont(size: 14, weight: .regular))
                        .foregroundColor(.gray60)
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                }
            }

            Spacer()

            if configuration.showChevron {
                Image("Chevron-right")
            }

            if configuration.showArrow {
                Image("arrowRightIcon")
            }

            if configuration.showToggle, let isOn = configuration.isOn {
                Toggle(isOn: Binding(
                    get: { isOn },
                    set: { newValue in
                        settingViewModel.updateToggle(for: configuration.text, newValue: newValue)
                    }
                )) {}
                    .toggleStyle(CustomToggle())
            }

            if configuration.showVersion {
                Text(settingViewModel.appVersion)
                    .font(.customFont(size: 14, weight: .medium))
                    .foregroundStyle(.gray30)
            }
        }
        .padding(20)
        .frame(maxWidth: 344, maxHeight: (configuration.showDesc ? 120 : 55))
        .background(.gray10)
        .cornerRadius(20)
    }
}

// #Preview {
//    CustomCell(showDesc: true, showChevron: false, showArrow: false, showToggle: true, showVersion: false, text: "애플 헬스 연동")
// }
