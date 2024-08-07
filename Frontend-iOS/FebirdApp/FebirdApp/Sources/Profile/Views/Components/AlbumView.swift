//
//  AlbumView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct AlbumView: View {
    let album: AlbumData
    @State private var isExpanded = false

    var body: some View {
        VStack {
            Button(action: {
                if album.hasData {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isExpanded.toggle()
                    }
                }
            }) {
                HStack {
                    Text(album.title)
                        .font(.customFont(size: 18, weight: .medium))
                        .foregroundStyle(album.hasData ? .black : .gray)
                    Spacer()
                    Image(isExpanded ? "Chevron-down" : "Chevron-right")
                }
                .padding()
                .background(album.hasData ? .gray10 : .gray30)
            }
            .disabled(!album.hasData)

            if isExpanded && album.hasData {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                    ForEach(1...album.dayCount, id: \.self) { day in
                        VStack {
                            Text("Day \(day)")
                                .font(.customFont(size: 14, weight: .regular))
                                .foregroundStyle(.black)

                            if let record = album.levelRecords?.first(where: { $0.levelId == day }) {

                                if let imageData = record.imageData, let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Rectangle())
                                        .cornerRadius(10)
                                } else {
                                    Image("defaultAlbum")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Rectangle())
                                        .cornerRadius(10)
                                }
                            } else {
                                Image("defaultAlbumGray")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Rectangle())
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding()
                .background(.gray10)
            }
        }
        .background(.gray10)
        .cornerRadius(14)
        .shadow(color: .gray20, radius: 5, x: 0, y: 2)
        .animation(.easeInOut(duration: 0.3), value: isExpanded)
    }
}

#Preview {
    AlbumView(album: AlbumData(educationLevel: .kindergarten, grade: .kindergarten1, levelRecords: [LevelRecordData(routineId: 1001, levelId: 1, schoolName: "피오 유치원", grade: 1, imageData: UIImage(named: "peoLogo") ?? UIImage())]))
}
