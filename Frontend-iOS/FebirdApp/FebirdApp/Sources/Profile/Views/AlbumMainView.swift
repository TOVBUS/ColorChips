//
//  AlbumMainView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct AlbumMainView: View {
    @EnvironmentObject var profileSelectViewModel: ProfileSelectViewModel
    let albums: [AlbumData] = [AlbumData(educationLevel: .kindergarten, grade: .kindergarten1, levelRecords: [LevelRecordData(levelId: 1, schoolName: "피오 유치원", imageData: UIImage(systemName: "photo") ?? UIImage())])]

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
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
    }
}

// #Preview {
//    AlbumMainView(albums: dummyAlbums)
//        .environmentObject(ProfileSelectViewModel())
// }
