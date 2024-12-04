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
        LazyVGrid(columns: [.init(), .init()]) {
            ForEach(cells) { $0 }
        }
    }
}

#Preview {
    LogTab(categories: .preview)
}
