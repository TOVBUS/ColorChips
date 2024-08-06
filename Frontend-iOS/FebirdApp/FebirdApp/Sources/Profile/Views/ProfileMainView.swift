//
//  ProfileMainView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 8/2/24.
//

import SwiftUI

struct ProfileMainView: View {
    @EnvironmentObject var navigationPathFinder: NavigationPathFinder<ProfileViewOptions>
    @EnvironmentObject var tabViewModel: TabViewModel
    @StateObject var profileSelectViewModel = ProfileSelectViewModel()
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                ProfileHeaderView()

                VStack {
                    switch profileSelectViewModel.mainContentType {
                    case .album:
                        AlbumMainView(albums: dummyAlbums)
                    case .inbody:
                        InbodyMainView(inbodys: inbodyDummyData)
                    case .eyeBody:
                        EyeBodyMainView()
                    }
                }
                .padding(.top, 24)
                .padding(.bottom, ConstantsPadding.mealMainOnCustomTabBar.rawValue)
            }
        }
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
        .environmentObject(profileSelectViewModel)
        .onAppear {
            tabViewModel.isHidden = false
        }
    }
}

#Preview {
    ProfileMainView()
        .environmentObject(ProfileSelectViewModel())
        .environmentObject(TabViewModel())
}
