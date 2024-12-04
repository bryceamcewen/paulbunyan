//
//  LogTab.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

struct LogTab: View {
    let categories: Categories
    
    @State private var editingCategory: Category.ID?
    
    
    var cells: [Cell] {
        categories.saved.map { category in
            Cell(
                category: category,
                primaryAction: {
                    action(for: category)
                },
                editAction: {
                    editingCategory = category.id
                },
                dataAction: {
                    
                }
            )
        }
    }

    func action(for category: Category) {
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
            .navigationDestination(item: $editingCategory) { id in
                if let category = categories.saved.first(where: { category in
                    category.id == id
                }) {
                    Text(category.name)
                        .navigationTitle(category.name)
                } else {
                    Text("Category not found")
                }
            }
        }
    }
}

#Preview {
    LogTab(categories: .preview)
}
