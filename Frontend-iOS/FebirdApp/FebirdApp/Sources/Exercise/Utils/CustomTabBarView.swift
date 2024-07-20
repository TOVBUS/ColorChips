//
//  CustomTabBarView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/19/24.
//

import SwiftUI

enum TabSelection: Int, CaseIterable {
    case meal = 0
    case exercise = 1
    case profile = 2
}

struct TabItem: Identifiable {
    let id = UUID()
    let iconName: String
    let tab: TabSelection
    let action: () -> Void
}

// MARK: - View Models
class TabViewModel: ObservableObject {
    @Published var selectedTab: TabSelection = .exercise
    
    let tabs: [TabItem] = [
        TabItem(iconName: "MealTabIcon", tab: .meal, action: { print("Meal tab tapped") }),
        TabItem(iconName: "ExerciseTabIcon", tab: .exercise, action: { print("Exercise tab tapped") }),
        TabItem(iconName: "ProfileTabIcon", tab: .profile, action: { print("Profile tab tapped") })
    ]
    
    func selectTab(_ tab: TabSelection) {
        selectedTab = tab
        tabs.first { $0.tab == tab }?.action()
    }
}

struct CustomTabBarView: View {
    @StateObject private var tabViewModel = TabViewModel()
    
    var body: some View {
        HStack(alignment: .center, spacing: 48) {
            ForEach(tabViewModel.tabs) { tab in
                TabButtonView(
                    iconName: tab.iconName,
                    isSelected: tabViewModel.selectedTab == tab.tab,
                    action: { tabViewModel.selectTab(tab.tab) }
                )
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .drawingGroup()
        .offset(y: -18)
        .shadow(color: .gray20, radius: 10, x: 0, y: 0)
    }
}

struct TabButtonView: View {
    let iconName: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                if isSelected {
                    Image("SelectedTabBackground")
                }
                
                Image(iconName)
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? .black : .gray40)
                    .padding(20)
            }
        }
    }
}

#Preview {
    CustomTabBarView()
}
