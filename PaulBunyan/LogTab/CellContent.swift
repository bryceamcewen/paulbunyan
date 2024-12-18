//
//  CellContent.swift
//  PaulBunyan
//
//  Created by Bryce McEwen on 12/17/24.
//

import SwiftUI

struct CellTopButtons: View {
    let dataAction: () -> Void
    let editAction: () -> Void
    var body: some View {
        HStack {
            CornerButton(
                systemImageName: "chart.line.uptrend.xyaxis",
                action: dataAction
            )
            
            Color.clear.aspectRatio(1, contentMode: .fit)
            Color.clear.aspectRatio(1, contentMode: .fit)
            Color.clear.aspectRatio(1, contentMode: .fit)

            CornerButton(
                systemImageName: "ellipsis",
                action: editAction
            )
        }
    }
}

struct CenterCellImage: View {
    let systemImage: String
    var body: some View {
        Image(systemName: systemImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct CellCard: View {
    var background: Color = .clear
    var border: Color = .primary
    var borderLineWidth: Double = 1
    var cornerRadius: Double = 24

    private var shape: some Shape {
        RoundedRectangle(cornerRadius: cornerRadius)
    }
    
    var body: some View {
        shape
            .fill(background)
            .overlay {
                shape.stroke(
                    border,
                    lineWidth: borderLineWidth
                )
            }
    }
}

struct CornerButton: View {
    let systemImageName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .aspectRatio(1.0, contentMode: .fit)
        }
    }
}

