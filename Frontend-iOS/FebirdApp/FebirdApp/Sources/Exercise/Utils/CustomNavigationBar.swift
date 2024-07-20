//
//  CustomNavigationBar.swift
//  FebirdApp
//
//  Created by DOYEON JEONG on 7/20/24.
//

import SwiftUI

struct CustomNavigationBar: View {
    
    var isSubView = true
    @State var title: String
    
    var body: some View {
        HStack(spacing: 12) {
            if isSubView {
                Image("Chevron-left")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Text(title)
                .font(.customFont(size: 22, weight: .bold))
                .lineSpacing(32)
                .foregroundColor(.gray90)
                .frame(maxWidth: .infinity)
                .padding(.trailing, 30)
            
        }
        .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32)
    }
}


#Preview {
    CustomNavigationBar(title: "스모 스쿼트")
}
