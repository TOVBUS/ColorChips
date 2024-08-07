//
//  ContentView.swift
//  ViewModelSample
//
//  Created by DOYEON JEONG on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HistoryViewModel()

    var body: some View {
        VStack {
            Button("Create History") {
                Task {
                    let createHistoryDto = CreateHistoryDto(achievementDate: Date())
                    await viewModel.createHistory(memberID: 27, createHistoryDto: createHistoryDto)
                }
            }

            Button("Fetch Histories") {
                Task {
                    await viewModel.findAllHistories(memberId: 27)
                }
            }

            List(viewModel.histories, id: \.historyID) { history in
                Text("History ID: \(history.historyID)")
            }

            if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            }
        }
    }
}


#Preview {
    ContentView()
}
