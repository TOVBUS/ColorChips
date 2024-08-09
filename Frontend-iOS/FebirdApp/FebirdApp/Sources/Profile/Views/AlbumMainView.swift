//
//  AlbumMainView.swift
//  FebirdApp
//
//  Created by 김혜수 on 7/21/24.
//

import SwiftUI
import SwiftData

struct AlbumMainView: View {
    @EnvironmentObject var profileSelectViewModel: ProfileSelectViewModel
    @EnvironmentObject private var albumViewModel: AlbumViewModel
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(albumViewModel.albums) { album in
                            AlbumView(album: album)
                        }
                    }
                    .padding()
                }
            }
        }
        .task {
            await albumViewModel.fetchAlbums(context: modelContext)
        }
    }
}
