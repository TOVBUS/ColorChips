//
//  AlbumView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct PhotoData: Identifiable {
    let id = UUID()
    let day: Int
    let imageName: String
}

struct AlbumData: Identifiable {
    let id = UUID()
    let title: String
    let photos: [PhotoData]
}

struct AlbumView: View {
    let album: AlbumData
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(album.title)
                        .font(.customFont(size: 18, weight: .medium))
                        .foregroundStyle(Color.black)
                    Spacer()
                    Image(isExpanded ? "Chevron-down" : "Chevron-right")
                }
                .padding()
                .background(Color.gray10)
            }

            if isExpanded {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                    ForEach(album.photos) { photo in
                        VStack {
                            Text("Day \(photo.day)")
                                .font(.customFont(size: 14, weight: .regular))
                            Image(photo.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
                .background(Color.gray10)
            }
        }
        .background(Color.gray10)
        .cornerRadius(14)
        .shadow(color: Color.gray20, radius: 5, x: 0, y: 2)
        .animation(.easeInOut(duration: 0.3), value: isExpanded)
    }
}

struct MainView: View {
    let albums: [AlbumData]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(albums) { album in
                    AlbumView(album: album)
                }
            }
            .padding()
        }
    }
}

func generateDummyAlbums() -> [AlbumData] {
    let albumTitles = ["유치원 씨앗반 시절", "유치원 새싹반 시절", "유치원 열매반 시절"]
    let photoCounts = [3, 5, 7]

    return zip(albumTitles, photoCounts).map { title, count in
        let photos = (1...count).map { day -> PhotoData in
            let imageName = Bool.random() ? "photo_\(title)_day\(day)" : "peoLogo"
            return PhotoData(day: day, imageName: imageName)
        }
        return AlbumData(title: title, photos: photos)
    }
}

let dummyAlbums = generateDummyAlbums()

#Preview {
    MainView(albums: dummyAlbums)
}
