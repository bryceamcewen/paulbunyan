//
//  ReviewTab.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

struct ReviewTab: View {
    let categories: Categories

    var body: some View {
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
}

#Preview {
    ReviewTab(categories: .preview)
}
