//
//  TapEventCategoryCell.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

struct TapEventCategoryCell: View, Identifiable {
    let category: DisplayableCategory<TapEntry>
    let primaryAction: () -> Void
    let topButtons: CellTopButtons

    var id: UUID { category.id }

    var body: some View {
        Button(action: primaryAction) {
            CellCard()
                .overlay {
                    VStack {
                        topButtons
                            .border(.yellow)
                        
                        CenterCellImage(
                            systemImage: category.imageSystemName
                        )
                        .border(.blue)

                        topButtons.hidden()
                            .border(.red)
                    }
                    .padding()
                }
            .aspectRatio(1.0, contentMode: .fit)
        }
        .padding()
    }

}

#Preview {
    TapEventCategoryCell(
        category: .init(
            name: "example",
            imageSystemName: "lightbulb",
            entries: []
        ),
        primaryAction: {
            print("tapped")
        },
        topButtons: .init(
            dataAction: {},
            editAction: {}
        )
    )
}
