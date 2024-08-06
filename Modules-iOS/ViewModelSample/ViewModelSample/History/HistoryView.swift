//
//  HistoryView.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import SwiftUI

struct HistoryView: View {
    //@StateObject private var viewModel = HistoryViewModel()
    //@State private var newHistory = History(id: 27, achievementDate: String(Date()))
    @State private var selectedHistoryId: Int = 0
    
    var body: some View {
        NavigationView {
            List {
//                Section(header: Text("Create History")) {
//                    DatePicker("Achievement Date", selection: $newHistory.achievementDate, displayedComponents: .date)
//                    TextField("Member ID", value: $newHistory.memberId, format: .number)
//                    TextField("Level ID", value: $newHistory.levelId, format: .number)
//                    
//                    Button("Create") {
//                        viewModel.createHistory(newHistory)
//                    }
//                }
//                Section(header: Text("Histories")) {
//                    ForEach(viewModel.histories) { history in
//                        Text("Member ID: \(history.memberId), Level ID: \(history.levelId)")
//                    }
//                }
                Section(header: Text("Get History")) {
                    TextField("History ID", value: $selectedHistoryId, format: .number)
                    Button("Get") {
                        //viewModel.getHistory(id: selectedHistoryId)
                        Task {
                            try await getHistory()
                        }
                    }
                }
//                if let selectedHistory = viewModel.selectedHistory {
//                    Section(header: Text("Selected History")) {
//                        Text("Member ID: \(selectedHistory.memberId), Level ID: \(selectedHistory.levelId)")
//                    }
//                }
//                if let error = viewModel.error {
//                    Section {
//                        Text(error.localizedDescription)
//                            .foregroundColor(.red)
//                    }
//                }
            }
            .navigationTitle("History Management")
        }
    }
    func getHistory() async {
        do {
            let history: [History] = try await NetworkManager.fetch("https://app-feo.azurewebsites.net/member/27/history", method: .get)
            print(history)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    HistoryView()
}
