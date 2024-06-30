//
//  ContentView.swift
//  CustomTabView
//
//  Created by 김수영 on 6/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentTab) {
                Text("홈뷰")
                    .tag(Tab.home)
                Text("게시판뷰")
                    .tag(Tab.forum)
                Text("스터디뷰")
                    .tag(Tab.study)
                Text("프로필뷰")
                    .tag(Tab.profile)
                
            }
            
            CustomTabView(currentTab: $currentTab)
        }
    }
}

#Preview {
    ContentView()
}
