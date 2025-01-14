//
//  PaulBunyanApp.swift
//  PaulBunyan
//
//  Created by Bryce McEwen on 12/3/24.
//

import SwiftUI

@main
struct PaulBunyanApp: App {
    @State private var categories: Categories = .preview
    var body: some Scene {
        WindowGroup {
            Root(categories: $categories)
        }
    }
}
