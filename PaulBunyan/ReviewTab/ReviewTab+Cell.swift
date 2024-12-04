//
//  ReviewTab+Cell.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

extension ReviewTab {
    struct Cell: View {
        let entry: Entry
        var body: some View {
            Text("\(entry.timestamp, format: .dateTime.minute().second())")
        }
    }
}

#Preview {
    ReviewTab.Cell(
        entry: .init(
            timestamp: .now,
            location: .init(
                latitude: 2,
                longitude: 2
            )
        )
    )
}
