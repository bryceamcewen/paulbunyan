//
//  ValueEventCategoryCell.swift
//  PaulBunyan
//
//  Created by Bryce McEwen on 12/17/24.
//


import SwiftUI

struct ValueEventCategoryCell: View, Identifiable {
    let category: DisplayableCategory<ValueEntry>
    let primaryAction: () -> Void
    
    var topButtons: CellTopButtons {
        .init(
            dataAction: {
                
            },
            editAction: {
                editingValue = true
            }
        )
    }
    
    @State private var editingValue: Bool = false
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
                            
                            Button("Done") {
                                editingValue = false
                            }
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
            entries: []
        ),
        primaryAction: {
            print("Valueped")
        }
    )
}
