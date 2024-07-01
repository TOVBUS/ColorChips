//
//  MyButtonStyle.swift
//  NavigationStackAndTabs
//
//  Created by 이유경 on 6/28/24.
//

import SwiftUI

enum ButtonType {
    case tab, long
}

// MARK: - ButtonStyle 공부하기~
/*
 configuration.label  // 글자
 configuration.isPressed // 버튼이 눌렸는지
 configuration.self // 나 자신
 */
struct MyButtonStyle: ButtonStyle {
    var color: Color
    var type: ButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            //1이 100%
            .onTapGesture { // tap이 됐을 때 처리
                if (self.type == .tab) {
                    let haptic = UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred()
                }
            }
            .onLongPressGesture {
                if (self.type == .long) {
                    let haptic = UIImpactFeedbackGenerator(style: .heavy)
                    haptic.impactOccurred()
                }
            }
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("button!!!")
        }, label: {
            Text("hahaha")
        }).buttonStyle(MyButtonStyle(color: .yellow, type: .tab))
    }
}

// MARK: - ButtonStyle 연습
/*
 VStack {
 Button(action: {
 print("button!!!")
 }, label: {
 Text("hahaha")
 }).buttonStyle(MyButtonStyle(color: Color.blue, type: .tab))
 Button(action: {
 print("button!!!")
 }, label: {
 Text("ha")
 }).buttonStyle(MyButtonStyle(color: Color.green, type: .long))
 }
 }
 */
