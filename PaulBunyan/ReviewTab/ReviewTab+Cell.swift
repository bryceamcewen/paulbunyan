//
//  ReviewTab+Cell.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

extension ReviewTab {
    enum Cell: View {
        case tap(TapCell)
        case value(ValueCell)
        var body: some View {
            switch self {
            case .tap(let tapCell): tapCell
            case .value(let valueCell): valueCell
            }
        }
    }
    struct TapCell: View {
        let entry: TapEntry
        var body: some View {
            Text("\(entry.timestamp, format: .dateTime.minute().second())")
            Text("\(entry.location)")
        }
    }
    struct ValueCell: View {
        let entry: ValueEntry
        var body: some View {
            Text("\(entry.timestamp, format: .dateTime.minute().second())")
            Text("\(entry.value, specifier: "%0.2f")")
        }
    }
}

#Preview {
    ReviewTab.Cell.value(
        .init(
            entry: .init(
                timestamp: .now,
                value: 0.0
            )
        )
    )
}
