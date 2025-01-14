//
//  LogTab.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

struct LogTab: View {
    @Binding var categories: Categories
    
    @State private var editingCategory: Category.ID?
    @State private var descriptionBinding: String = ""
    
    struct Root: View {
        let cells: [Cell]
        var body: some View {
            VStack {
                LazyVGrid(columns: [.init(), .init()]) {
                    ForEach(cells) { $0 }
                }
                Spacer(minLength: 0)
            }
        }
    }
    
    struct Cell: View, Identifiable {
        var id: UUID { category.id }
        let category: Category
        let primaryAction: () -> Void
        let dataAction: () -> Void
        let editAction: () -> Void

        var body: some View {
            switch category.mode {
            case .tap:
                TapEventCategoryCell(
                    category: category,
                    primaryAction: primaryAction,
                    topButtons: .init(
                        dataAction: dataAction,
                        editAction: editAction
                    )
                )
            case .value:
                ValueEventCategoryCell(
                    category: category,
                    editingValue: true,
                    primaryAction: primaryAction,
                    topButtons: .init(
                        dataAction: dataAction,
                        editAction: editAction
                    ),
                    onEditingDone: {
                        
                    }
                )
            }
        }
    }
    
    var cells: [Cell] {
        categories.list.map { category in
            Cell(
                category: category,
                primaryAction: {
                    var copy = category
                    copy.taps.append(
                        .init(
                            timestamp: .now,
                            location: .init(
                                latitude: 0.0,
                                longitude: 0.0
                            )
                        )
                    )
                    self.categories.saved[copy.id] = copy
                },
                dataAction: {
                    
                },
                editAction: {
                    print("Clicking the edit button")
                    editingCategory = category.id
                }
            )
        }
    }


    var body: some View {
        NavigationStack {
            Root(
                cells: cells
            )
            .navigationTitle("Bunyan")
            .toolbar {
                ToolbarItem {
                    AddButton {
                        print("action")
                    }
                }
            }
            .navigationDestination(item: $editingCategory) { id in
                Destinations(categories: categories, selected: id)
            }
        }
    }
    
    struct Destinations: View {
        let categories: Categories
        let selected: Category.ID
        var body: some View {
            if let category = categories.saved[selected] {
                //descriptionBinding = category.description
                CategoryDetail(category: category)

            } else {
                Text("Category not found")
            }

        }
    }
}



#Preview {
    @Previewable @State var categories: Categories = .preview
    LogTab(categories: $categories)
}



struct AddButton: View {
    let action: () -> Void
    var body: some View {
        Button(
            action: action,
            label: {
                Image(systemName: "plus")
                    .font(.title)
            }
        )
    }
    
}

