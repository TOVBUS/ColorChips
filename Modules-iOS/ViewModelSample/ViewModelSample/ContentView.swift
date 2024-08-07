//
//  ContentView.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/7/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Chat with GPT-4o-mini") {
//                    ChatView()
                    ChatView()
                }
                .padding()
            }
            .navigationTitle("Main Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ContentView()
}
