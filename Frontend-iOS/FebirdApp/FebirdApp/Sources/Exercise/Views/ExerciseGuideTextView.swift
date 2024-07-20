//
//  ExerciseGuideTextView.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI

struct ExerciseGuideTextView: View {
    var attributedString: AttributedString
    
    init(_ attributedString: AttributedString) {
        self.attributedString = attributedString
    }
    
    var body: some View {
        Text(attributedString)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.customFont(size: 16, weight: .regular))
    }
}

#Preview {
    ExerciseGuideTextView("something")
}
