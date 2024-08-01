//
//  AlbumMainView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI

struct AlbumMainView: View {
    let albums: [AlbumData]

    var body: some View {
        VStack {
            ProfileHeaderView()

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

#Preview {
    AlbumMainView(albums: dummyAlbums)
}
