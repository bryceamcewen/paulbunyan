//
//  Cell.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

extension LogTab {
    struct Cell: View, Identifiable {
        let category: Category
        let primaryAction: () -> Void
        let editAction: () -> Void
        let dataAction: () -> Void

        var id: UUID { category.id }

        var body: some View {
            Button(action: primaryAction) {
                Content(
                    systemImage: category.imageSystemName,
                    editAction: editAction,
                    dataAction: dataAction
                )
            }
            .padding()
        }

        struct Content: View {
            let systemImage: String
            let editAction: () -> Void
            let dataAction: () -> Void
            
            private let cornerRadius: Double = 24
            private let cornerButtonFraction: Double = 1 / 8
            private let cornerButtonPaddingFraction: Double = 1 / 1.3

            var body: some View {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        GeometryReader { proxy in
                            Color.clear
                                .overlay(alignment: .topLeading) {
                                    CornerButton(
                                        dimension: proxy.size.width * cornerButtonFraction,
                                        systemImageName: "chart.line.uptrend.xyaxis"
                                    ) {
                                        dataAction()
                                        print("tapped data button")
                                    }
                                    .padding(cornerRadius * cornerButtonPaddingFraction)
                                }
                                .overlay(alignment: .topTrailing) {
                                    CornerButton(
                                        dimension: proxy.size.width * cornerButtonFraction,
                                        systemImageName: "ellipsis"
                                    ) {
                                        print("tapped edit button")
                                        editAction()
                                    }
                                    .padding(cornerRadius * cornerButtonPaddingFraction)
                                }
                                .overlay {
                                    Image(systemName: systemImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(0.25 * proxy.size.height)
                                }
                        }
                    }

            }
        }

        struct CornerButton: View {
            let dimension: Double
            let systemImageName: String
            let action: () -> Void

            var body: some View {
                Button(action: action) {
                    Image(systemName: systemImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: dimension,
                            height: dimension
                        )
                }
            }
        }
    }
}

#Preview {
    LogTab.Cell(
        category: .init(
            name: "example",
            imageSystemName: "lightbulb",
            entries: []
        ),
        primaryAction: {
            print("tapped")
        },
        editAction: {
            
        },
        dataAction: {
            
        }
    )
}
