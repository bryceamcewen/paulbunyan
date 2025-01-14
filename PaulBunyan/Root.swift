//
//  Root.swift
//  PaulBunyan
//
//  Created by Bryce McEwen on 12/3/24.
//

import SwiftUI

struct Root: View {
    @Binding var categories: Categories

    var body: some View {
        TabView {
            LogTab(categories: $categories)
                .tabItem {
                    Label("Log", systemImage: "list.clipboard")
                }

            ReviewTab(categories: categories)
                .tabItem {
                    Label("Review", systemImage: "chart.xyaxis.line")
                }
        }
    }
}


#Preview {
    @Previewable @State var categories: Categories = .preview
    Root(categories: $categories)
}
