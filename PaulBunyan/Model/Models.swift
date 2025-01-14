//
//  Models.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import Foundation

struct Categories {
    var saved: [Category.ID: Category]
    var list: [Category] {
        saved.values.sorted {
            $0.created < $1.created
        }
    }
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

