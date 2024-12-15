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

enum Category: Identifiable {
    var id: UUID {
        switch self {
        case .tap(let category):
            category.id
        case .value(let category):
            category.id
        }
    }

    case tap(DisplayableCategory<TapEntry>)
    case value(DisplayableCategory<ValueEntry>)
}

struct DisplayableCategory<Entry>: Identifiable {
    var id: UUID = .init()
    var name: String
    var imageSystemName: String
    var entries: [Entry]
}

enum Entry: Identifiable {
    var id: Date {
        switch self {
        case .tap(let tapEntry):
            tapEntry.id
        case .value(let valueEntry):
            valueEntry.id
        }
    }
    case tap(TapEntry)
    case value(ValueEntry)
}

struct TapEntry: Identifiable {
    var id: Date { timestamp }
    let timestamp: Date
    let location: Coordinates
}

struct ValueEntry: Identifiable {
    var id: Date { timestamp }
    let timestamp: Date
    let value: Double
}

struct Coordinates {
    let latitude: Double
    let longitude: Double
}

extension Categories {
    enum Example {
        static let lights: DisplayableCategory<TapEntry> = .init(
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
        )
        static let water: DisplayableCategory<ValueEntry> = .init(
            name: "Water",
            imageSystemName: "drop",
            entries: [
                .init(
                    timestamp: .now,
                    value: 1.0
                ),
                .init(
                    timestamp: .now.addingTimeInterval(-1),
                    value: 0.5
                ),
                .init(
                    timestamp: .now.addingTimeInterval(-2),
                    value: 1.0
                ),
            ]
        )
        static let exercise: DisplayableCategory<ValueEntry> = .init(
            name: "Exercise",
            imageSystemName: "figure.pool.swim",
            entries: [
                .init(
                    timestamp: .now,
                    value: 60.0
                ),
                .init(
                    timestamp: .now.addingTimeInterval(-1),
                    value: 120.0
                ),
                .init(
                    timestamp: .now.addingTimeInterval(-2),
                    value: 30.0
                ),
            ]
        )
    }
    static let preview: Self = .init(
        saved: [
            .tap(Example.lights),
            .value(Example.water),
            .value(Example.exercise),
        ]
    )
}
