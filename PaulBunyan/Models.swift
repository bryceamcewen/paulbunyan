//
//  Models.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import Foundation

struct Categories {
    let saved: [Category]
}

struct Category: Identifiable {
    var id: UUID = .init()
    let name: String
    let imageSystemName: String
    let entries: [Entry]
}

struct Entry: Identifiable {
    var id: Date { timestamp }
    let timestamp: Date
    let location: Coordinates
}

struct Coordinates {
    let latitude: Double
    let longitude: Double
}

extension Categories {
    static let preview: Self = .init(
        saved: [
            .init(
                name: "Lights",
                imageSystemName: "lightbulb",
                entries: [
                    .init(
                        timestamp: .now,
                        location: .init(latitude: 1, longitude: 2)
                    ),
                    .init(
                        timestamp: .now.addingTimeInterval(-1),
                        location: .init(latitude: 1, longitude: 2)
                    ),
                    .init(
                        timestamp: .now.addingTimeInterval(-2),
                        location: .init(latitude: 1, longitude: 2)
                    ),
                ]
            ),
            .init(
                name: "Water",
                imageSystemName: "drop",
                entries: [
                    .init(
                        timestamp: .now,
                        location: .init(latitude: 1, longitude: 2)
                    ),
                    .init(
                        timestamp: .now.addingTimeInterval(-1),
                        location: .init(latitude: 1, longitude: 2)
                    ),
                    .init(
                        timestamp: .now.addingTimeInterval(-2),
                        location: .init(latitude: 1, longitude: 2)
                    ),
                ]
            ),
            .init(
                name: "Exercise",
                imageSystemName: "figure.pool.swim",
                entries: [
                    .init(
                        timestamp: .now,
                        location: .init(latitude: 1, longitude: 2)
                    ),
                    .init(
                        timestamp: .now.addingTimeInterval(-1),
                        location: .init(latitude: 1, longitude: 2)
                    ),
                    .init(
                        timestamp: .now.addingTimeInterval(-2),
                        location: .init(latitude: 1, longitude: 2)
                    ),
                ]
            ),
        ]
    )
}
