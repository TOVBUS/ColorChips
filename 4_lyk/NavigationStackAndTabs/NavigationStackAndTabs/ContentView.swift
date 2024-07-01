//
//  ContentView.swift
//  NavigationStackAndTabs
//
//  Created by 이유경 on 6/27/24.
//

import SwiftUI

enum ViewOptions: Hashable {
    case homeFirst(champion: ChampionModel)
    case homeSecond(champion: ChampionModel)
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .homeFirst(let champion): HomeRowDestinationView(champion: champion)
        case .homeSecond(let champion): HomeSkinBuyView(champion: champion)
        }
    }
}

final class NavigationPathFinder: ObservableObject {
    static let shared = NavigationPathFinder()
    private init() { }
    
    @Published var path: NavigationPath = .init()
    
    func addPath(option: ViewOptions) { //path 추가
        path.append(option)
    }
    
    func popToRoot() { //path 삭제
        path = .init()
    }
}

struct ContentView: View {
    @EnvironmentObject private var navPathFinder: NavigationPathFinder
    @State var currentTab: Tab = .home
    
    init() { // 원래 있던 UITabBar가 사라지도록 함
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationStack(path: $navPathFinder.path) {
            ZStack(alignment: .bottom) {
                TabView(selection: $currentTab) {
                    HomeView()
                        .tag(Tab.home)
                    
                    Text("게시판뷰")
                        .tag(Tab.forum)
                    Text("스터디뷰")
                        .tag(Tab.study)
                    Text("프로필뷰")
                        .tag(Tab.profile)
                }
                //                .toolbar(.hidden, for: .tabBar) <- 이렇게 써도 됨
                CustomTabView(currentTab: $currentTab)
            }
            .navigationDestination(for: ViewOptions.self) { option in
                option.view()
            }
        }
    }
}

struct ChampionModel: Identifiable, Hashable {
    let id = UUID().uuidString
    let name: String
    let dialogue: String
    let imageURL: String
}

extension ChampionModel {
    static let mockChampions: [ChampionModel] = [
        ChampionModel(name: "아트록스", dialogue: "종말을 내려주마.", imageURL: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Aatrox_0.jpg"),
        ChampionModel(name: "아리", dialogue: "똑똑한 여우는 절대 잡히지 않거든.", imageURL: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_7.jpg"),
        ChampionModel(name: "애쉬", dialogue: "계속 나아가야 해.", imageURL: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ashe_9.jpg"),
        ChampionModel(name: "다이애나", dialogue: "밤이 오면 달이 떠오르지.", imageURL: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Diana_2.jpg"),
        ChampionModel(name: "카이사", dialogue: "이게 바로 내 존재의 이유다!", imageURL: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Kaisa_1.jpg"),
        ChampionModel(name: "케일", dialogue: "날 두려워하라", imageURL: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Kayle_1.jpg"),
        ChampionModel(name: "룰루", dialogue: "보라색 맛났어!", imageURL: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Lulu_3.jpg"),
        ChampionModel(name: "라이즈", dialogue: "대상혁", imageURL: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ryze_3.jpg"),
        ChampionModel(name: "자르반", dialogue: "내 의지로, 여기서 끝을 보겠노라!", imageURL: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/JarvanIV_9.jpg"),
    ]
}

struct HomeView: View {
    @EnvironmentObject private var navPathFinder: NavigationPathFinder
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(ChampionModel.mockChampions) { champion in
                    Button {
                        navPathFinder.addPath(option: .homeFirst(champion: champion))
                    } label: {
                        HomeRowView(champion: champion)
                    }
                    .tint(.primary)
                }
            }
            .padding(.bottom, 50)
        }
    }
}

struct HomeRowView: View {
    let champion: ChampionModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 30, height: 30)
                VStack(alignment: .leading) {
                    Text(champion.name)
                        .font(.headline)
                    Text(champion.dialogue)
                        .font(.body)
                    AsyncImage(url: URL(string: champion.imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 320, height: 190)
                }
            }
            .padding()
            Divider()
        }
    }
}

struct HomeRowDestinationView: View {
    @EnvironmentObject private var navPathFinder: NavigationPathFinder
    let champion: ChampionModel
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: champion.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
            }
            .frame(width: 320, height: 190)
            
            Text(champion.name)
                .font(.largeTitle)
            Button(action: {
                navPathFinder.addPath(option: .homeSecond(champion: champion))
            }, label: {
                Text("스킨사기")
                    .font(.title)
                    .bold()
            })
        }
    }
}

struct HomeSkinBuyView: View {
    @EnvironmentObject private var navPathFinder: NavigationPathFinder
    let champion: ChampionModel
    
    var body: some View {
        Text(champion.name).bold().font(.largeTitle) + Text("스킨을 사시겠어요?")
        
        Button(action: {
            navPathFinder.popToRoot()
        }, label: {
            Text("안살래요")
                .font(.largeTitle)
        })
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationPathFinder.shared)
    
}


