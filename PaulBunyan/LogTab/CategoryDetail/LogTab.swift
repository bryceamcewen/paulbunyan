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
    @State private var descriptionBinding: String = ""
    
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
                        print("Value = ")
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
                    print("Clicking the edit button")
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
                    //descriptionBinding = category.description
                    CategoryDetail(category: category)

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
    var imageName: String {
        switch self {
        case .tap(let category):
            category.imageSystemName
        case .value(let category):
            category.imageSystemName
        }
        
    }
    var description: String {
        switch self {
        case .tap(let category):
            category.description
        case .value(let category):
            category.description
        }
    }
}

#Preview {
    LogTab(categories: .preview)
}

struct CategoryDetail: View {
    let category: Category
    var body: some View {
        VStack {
            Text(category.name)
                .navigationTitle("Modifying \(category.name)")
            CenterCellImage(
                systemImage: category.imageName
            )
            
            Text(category.description)
                .font(.largeTitle)
            
        }
    }
}
