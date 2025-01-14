//
//  Category.swift
//  PaulBunyan
//
//  Created by Bryce McEwen on 1/9/25.
//

import Foundation

struct Category: Identifiable {
    let id: UUID = .init()
    let created: Date = .now
    var name: String
    var imageSystemName: String
    var description: String = ""
    var mode: Mode
    var taps: [TapEntry] = []
    var values: [ValueEntry] = []
}

extension Category {
    enum Mode {
        case tap
        case value
    }
}

extension Category {
    
    enum Example {
        static let lights: Category = .init(
            name: "Lights",
            imageSystemName: "lightbulb",
            description: "Count of light turning off",
            mode: .tap,
            taps: [
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
        static let water: Category = .init(
            name: "Water",
            imageSystemName: "drop",
            mode: .value,
            values: [
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
        static let exercise: Category = .init(
            name: "Exercise",
            imageSystemName: "figure.pool.swim",
            mode: .value,
            values: [
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
        static let pulse: Category = .init(
            name: "Pulse",
            imageSystemName: "bolt.heart",
            description: "I measured my pulse",
            mode: .tap,
            taps: [
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
    }
}

extension Categories {
    static let preview: Self = .init(
        saved: [
            Category.Example.lights,
            Category.Example.water,
            Category.Example.exercise,
            Category.Example.pulse,
        ].reduce(into: [:]) { $0[$1.id] = $1 }
        //  Creates an array of categories using the example extension and then puts them into a dictionary
        // using reduce $0 is the dictionary item being built and $1 is the array item
    )
}

