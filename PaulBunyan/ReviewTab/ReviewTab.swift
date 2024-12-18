//
//  ReviewTab.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

enum PlotStyle: CaseIterable, Identifiable {
    var id: Self { self }
    case list, pie, line, histogram
    var name: String {
        switch self {
        case .list:
            "List"
        case .pie:
            "Pie Chart"
        case .line:
            "Line Plot"
        case .histogram:
            "Histogram"
        }
    }
}

struct ReviewTab: View {
    let categories: Categories

    @State private var selectedCategories: Set<Category.ID> = []
    @State private var selectedPlotStyle: PlotStyle = .list

    private var navTitle: String {
        "Time"
    }

    struct CategoryMenu: View {
        let categories: Categories
        @Binding var selectedCategories: Set<Category.ID>

        private var title: String {
            let value = selectedCategories
                .compactMap({ id in
                    categories.saved.first(where: { $0.id == id })
                })
                .sorted(by: { $0.name < $1.name })
                .map(\.name)
                .joined(separator: ", ")
            if value.isEmpty {
                return "None"
            } else {
                return value
            }
        }

        private func toggle(category: Category) {
            if selectedCategories.contains(category.id) { selectedCategories.remove(category.id)
            } else {
                selectedCategories.insert(category.id)
            }
        }
        
        var body: some View {
            Menu(title) {
                VStack {
                    ForEach(categories.saved) { category in
                        Button(
                            action: {
                                toggle(category: category)
                            },
                            label: {
                                Text(category.name)
                            }
                        )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .foregroundStyle(.white)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12)
            }
            .padding()
        }
    }

    struct PlotStyleMenu: View {
        
        @Binding var selectedPlotStyle: PlotStyle

        private var plotStyleMenuTitle: String {
            selectedPlotStyle.name
        }

        private func choose(plotStyle: PlotStyle) {
            selectedPlotStyle = plotStyle
        }

        var body: some View {
            Menu(plotStyleMenuTitle) {
                VStack {
                    ForEach(PlotStyle.allCases) { plotStyle in
                        Button(
                            action: {
                                choose(plotStyle: plotStyle)
                            },
                            label: {
                                Text(plotStyle.name)
                            }
                        )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .foregroundStyle(.white)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12)
            }
            .padding()
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    CategoryMenu(
                        categories: categories,
                        selectedCategories: $selectedCategories
                    )
                    
                    PlotStyleMenu(
                        selectedPlotStyle: $selectedPlotStyle
                    )
                }
                
                Spacer(minLength: 0)
            }
            .navigationTitle(navTitle)
        }
    }
    
    struct Scrollable: View {
        let categories: [Category]
        var body: some View {
            ScrollView(.vertical) {
                ForEach(categories) { category in
                    CategorySection(category: category)
                }
            }
        }
        
        struct CategorySection: View {
            let category: Category
            var body: some View {
                Section(category.name) {
                    switch category {
                    case .tap(let tapCategory):
                        TapEventCategoryCell(
                            category: tapCategory,
                            primaryAction: {},
                            topButtons: .init(
                                dataAction: {},
                                editAction: {}
                            )
                        )
                    case .value(let valueCategory):
                        Text("Unimplemented")
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewTab(categories: .preview)
}
