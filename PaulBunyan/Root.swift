//
//  Root.swift
//  PaulBunyan
//
//  Created by Bryce McEwen on 12/3/24.
//

import SwiftUI

struct Root: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    Root()
}
