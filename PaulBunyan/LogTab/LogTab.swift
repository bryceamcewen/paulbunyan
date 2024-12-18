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
    
    struct Cell: View, Identifiable {
        var id: UUID { category.id }
        let category: Category
        let primaryAction: () -> Void
        let editAction: () -> Void

        var body: some View {
            switch category {
            case .tap(let displayable):
                TapEventCategoryCell(
                    category: displayable,
                    primaryAction: primaryAction,
                    topButtons: .init(
                        dataAction: {
                            
                        },
                        editAction: editAction
                    )
                )
            case .value(let displayable):
                ValueEventCategoryCell(
                    category: displayable,
                    primaryAction: {
                        
                    }
                )
            }
        }
    }
    
    var cells: [Cell] {
        categories.saved.map { category in
            Cell(
                category: category,
                primaryAction: {
//                    action()
                    print("Clicking the data button")
                },
                editAction: {
                    editingCategory = category.id
                }
            )
        }
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

extension Category {
    var name: String {
        switch self {
        case .tap(let category):
            category.name
        case .value(let category):
            category.name
        }
    }
}

#Preview {
    LogTab(categories: .preview)
}
