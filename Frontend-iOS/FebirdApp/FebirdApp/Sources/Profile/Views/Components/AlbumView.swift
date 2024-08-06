//
//  AlbumView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

let dummyAlbums = generateDummyAlbums()

func generateDummyAlbums() -> [AlbumData] {
    let albumTitles = ["유치원 씨앗반 시절", "유치원 새싹반 시절", "유치원 열매반 시절"]
    let photoCounts = [3, 5, 7]

    return zip(albumTitles, photoCounts).map { title, count in
        let photos = (1...count).map { day -> PhotoData in
            let imageName = "peoLogo"
            return PhotoData(day: day, imageName: imageName)
        }
        return AlbumData(title: title, photos: photos)
    }
}

struct AlbumView: View {
    let album: AlbumData

    @State private var isExpanded = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(album.title)
                        .font(.customFont(size: 18, weight: .medium))
                        .foregroundStyle(.black)
                    Spacer()
                    Image(isExpanded ? "Chevron-down" : "Chevron-right")
                }
                .padding()
                .background(.gray10)
            }

            if isExpanded {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                    ForEach(album.photos) { photo in
                        VStack {
                            Text("Day \(photo.day)")
                                .font(.customFont(size: 14, weight: .regular))
                                .foregroundStyle(.black)
                            Image(photo.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .cornerRadius(10)
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
    AlbumView(album: dummyAlbums[0])
}
