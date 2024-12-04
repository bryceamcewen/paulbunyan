//
//  LogTab.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

struct LogTab: View {
    let categories: Categories

    var cells: [Cell] {
        categories.saved.map { category in
            Cell(
                category: category,
                primaryAction: {
                    action(for: category)
                }
            )
        }
    }

    func action(for category: Category) {
        print("tapped \(category.name)")
    }

    var body: some View {
        NavigationStack {
            VStack {
                LazyVGrid(columns: [.init(), .init()]) {
                    ForEach(cells) { $0 }
                }
                Spacer(minLength: 0)
            }
            .navigationTitle("Bunyan")
            .toolbar {
                ToolbarItem {
                    Button(
                        action: {
                            print("tapped plus button")
                        },
                        label: {
                            Image(systemName: "plus")
                                .font(.title)
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    LogTab(categories: .preview)
}
