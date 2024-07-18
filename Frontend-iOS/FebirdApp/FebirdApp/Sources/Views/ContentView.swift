//
//  ContentView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(items) { item in
                        NavigationLink(destination: ItemDetailView(item: item)) {
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                                .appFont(.title, language: .english)
                                .foregroundColor(.blue30)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }

                VStack(spacing: 20) {
                    Text("Add Item")
                        .appButton(style: .primary, action: addItem)

                    Text("Secondary Button")
                        .appButton(style: .secondary) {
                            print("Secondary button tapped")
                        }

                    Text("Show Alert")
                        .appButton(style: .tertiary) {
                            showAlert = true
                        }
                }
                .padding()
            }
            .navigationTitle("Items")
            .appAlert(
                isPresented: $showAlert,
                title: "Alert Title",
                message: "This is an alert message.",
                primaryButton: .default(Text("OK")),
                secondaryButton: .cancel(Text("Cancel"))
            )
        }
    }
}

struct ItemDetailView: View {
    let item: Item

    var body: some View {
        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
            .appFont(.title, language: .korean)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
