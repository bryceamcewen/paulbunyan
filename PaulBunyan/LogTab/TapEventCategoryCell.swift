//
//  TapEventCategoryCell.swift
//  PaulBunyan
//
//  Created by Goodrick,Joseph on 12/3/24.
//

import SwiftUI

struct TapEventCategoryCell: View, Identifiable {
    let category: Category
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

                        topButtons.hidden().overlay {
                            Text("\(category.taps.count)")
                        }
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
    @Previewable @State var category: Category = Category.Example.lights
    TapEventCategoryCell(
        category: Category.Example.lights,
        primaryAction: {
            print("tapped")
        },
        topButtons: .init(
            dataAction: {
                print("Tap view button tapped")
            },
            editAction: {
                print("Tap edit button tapped")
            }
        )
    )
}
