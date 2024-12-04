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

    private var categoryMenuTitle: String {
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

    private var plotStyleMenuTitle: String {
        selectedPlotStyle.name
    }

    private func choose(plotStyle: PlotStyle) {
        selectedPlotStyle = plotStyle
    }

    private func toggle(category: Category) {
        if selectedCategories.contains(category.id) { selectedCategories.remove(category.id)
        } else {
            selectedCategories.insert(category.id)
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Menu(categoryMenuTitle) {
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

                ScrollView(.vertical) {
                    ForEach(categories.saved) { category in
                        Section(category.name) {
                            ForEach(category.entries) { entry in
                                Cell(entry: entry)
                            }
                        }
                    }
                }
            }
            .navigationTitle(navTitle)
        }
    }
}

#Preview {
    ReviewTab(categories: .preview)
}
