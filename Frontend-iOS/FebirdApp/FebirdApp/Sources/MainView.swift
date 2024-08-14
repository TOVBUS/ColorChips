//
//  MainView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 8/15/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var tabViewModel: TabViewModel
    @EnvironmentObject private var mealNavigationPathFinder: NavigationPathFinder<MealViewOptions>
    @EnvironmentObject private var exerciseNavigationPathFinder: NavigationPathFinder<ExerciseViewOptions>
    @EnvironmentObject private var profileNavigationPathFinder: NavigationPathFinder<ProfileViewOptions>

    var body: some View {
        ZStack(alignment: .bottom) {
            switch tabViewModel.selectedTab {
            case .meal:
                NavigationStack(path: $mealNavigationPathFinder.path) {
                    MealMainView()
                        .navigationDestination(for: MealViewOptions.self) { option in
                            option.view()
                        }
                }
            case .exercise:
                NavigationStack(path: $exerciseNavigationPathFinder.path) {
                    ExerciseMainView()
                        .navigationDestination(for: ExerciseViewOptions.self) { option in
                            option.view()
                        }
                }
            case .profile:
                NavigationStack(path: $profileNavigationPathFinder.path) {
                    ProfileMainView()
                        .navigationDestination(for: ProfileViewOptions.self) { option in
                            option.view()
                        }
                }
            }
            CustomTabBarView()
        }
    }
}
