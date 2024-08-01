//
//  OnboardingProfileSelectionView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/17/24.
//

import SwiftUI

struct OnboardingProfileSelectionView: View {
    @State var selectedImageIndex: Int

    private let colorImages = [UIImage(named: "profile01")!, UIImage(named: "profile02")!, UIImage(named: "profile03")!, UIImage(named: "profile04")!, UIImage(named: "profile05")!, UIImage(named: "profile06")!, UIImage(named: "profile07")!, UIImage(named: "profile08")!, UIImage(named: "profile09")!, UIImage(named: "profile10")!]
    private let grayImages = [UIImage(named: "profile01_gray")!, UIImage(named: "profile02_gray")!, UIImage(named: "profile03_gray")!, UIImage(named: "profile04_gray")!, UIImage(named: "profile05_gray")!, UIImage(named: "profile06_gray")!, UIImage(named: "profile07_gray")!, UIImage(named: "profile08_gray")!, UIImage(named: "profile09_gray")!, UIImage(named: "profile10_gray")!]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 19, content: {
                ForEach(0..<grayImages.count, id: \.self) { index in
                    ZStack {
                        Image(uiImage: index == selectedImageIndex ? colorImages[index] : grayImages[index])
                            .frame(width: 128, height: 128)
                            .onTapGesture {
                                selectedImageIndex = index
                            }
                        if index == selectedImageIndex {
                            Image("triangleIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 33, height: 25)
                                .offset(x: 0, y: -94)
                        }
                    }.padding(.top, 60)

                }
            })
        }
    }
}

#Preview {
    OnboardingProfileSelectionView(selectedImageIndex: 0)
}
