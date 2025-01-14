//
//  ValueEventCategoryCell.swift
//  PaulBunyan
//
//  Created by Bryce McEwen on 12/17/24.
//


import SwiftUI

struct ValueEventCategoryCell: View, Identifiable {
    let category: Category
    let editingValue: Bool
    let primaryAction: () -> Void
    let topButtons: CellTopButtons
    let onEditingDone: () -> Void

    @State private var value: String = ""

    var id: UUID { category.id }
    
    var body: some View {
        Button(action: primaryAction) {
            CellCard()
                .overlay {
                    VStack {
                        if editingValue {
                            TextField("Value", text: $value)
                                .font(.largeTitle)
                            
                            Button("Done", action: onEditingDone)
                        } else {
                            topButtons
                                .border(.yellow)
                            
                            CenterCellImage(
                                systemImage: category.imageSystemName
                            )
                            .border(.blue)

                            topButtons.hidden()
                                .overlay {
                                    Group {
                                        if value.isEmpty {
                                            Text("Undefined")
                                        } else {
                                            Text(value)
                                        }
                                    }
                                    .font(.largeTitle)
                                    .minimumScaleFactor(0.01)
                                }
                                .border(.red)

                        }
                    }
                    .padding()
                }
            .aspectRatio(1.0, contentMode: .fit)
        }
        .padding()
    }
}

#Preview {
    ValueEventCategoryCell(
        category: .init(
            name: "example",
            imageSystemName: "figure.disc.sports",
            mode: .value
        ),
        editingValue: false,
        primaryAction: {
            print("Valueped \(10)")
        },
        topButtons: .init(dataAction: {
            
        }, editAction: {
            
        }),
        onEditingDone: {
            
        }
    )
}
