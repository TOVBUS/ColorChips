//
//  MealMainView.swift
//  FebirdApp
//
//  Created by 이유경 on 7/18/24.
//

import SwiftUI

struct MealMainView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AIMealRecomendationView()
        }
        .padding(25)
    }
}

#Preview {
    MealMainView()
}
