//
//  CategoryDetail.swift
//  PaulBunyan
//
//  Created by Bryce McEwen on 1/9/25.
//

import SwiftUI

struct CategoryDetail: View {
    let category: Category
    var body: some View {
        VStack {
            Text(category.name)
                .navigationTitle("Modifying \(category.name)")
            CenterCellImage(
                systemImage: category.imageSystemName
            )
            
            Text(category.description)
                .font(.largeTitle)
            
        }
    }
}
