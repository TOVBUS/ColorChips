//
//  MemoRow.swift
//  FebirdApp
//
//  Created by 이유경 on 7/19/24.
//

import SwiftUI

struct MemoRow: View {
    @State private var titleText: String
    @State private var contentText: String
    @State private var showModal = false
    @State private var showFullText = false
    @State private var mealImage: UIImage?
    var mealTime: String

    init(mealTime: String, initialTitle: String = "", initialContent: String = "", initialImage: UIImage? = nil) {
        self.mealTime = mealTime
        self._titleText = State(initialValue: initialTitle)
        self._contentText = State(initialValue: initialContent)
        self._mealImage = State(initialValue: initialImage)
    }

    var body: some View {
        HStack(spacing: 8) {
            Image(uiImage: mealImage ?? UIImage(named: "feoFace")!)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8) {
                Text(mealTime)
                    .font(.customFont(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(.orange40)
                    .cornerRadius(8)

                Text(titleText)
                    .font(.customFont(size: 17, weight: .bold))

                if !contentText.isEmpty {
                    Text(showFullText ? contentText : contentText.prefix(30) + (contentText.count > 30 ? "..." : ""))
                        .font(.customFont(size: 14, weight: .medium))
                        .foregroundStyle(.gray100)
                        .lineLimit(showFullText ? nil : 1)
                        .onTapGesture {
                            withAnimation {
                                showFullText.toggle()
                            }
                        }
                }
            }
            Spacer()

            Button(action: {
                showModal.toggle()
            }, label: {
                Image("pencilIcon")
                    .font(.customFont(size: 22, weight: .bold))
                    .foregroundStyle(.gray60)
                    .padding(8)
            })
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(.gray10)
        .cornerRadius(32)
        .sheet(isPresented: $showModal) {
            MemoModalView(image: $mealImage, contentText: $contentText, titleText: $titleText)
        }
    }
}

#Preview {
    MemoRow(mealTime: "점심")
}
