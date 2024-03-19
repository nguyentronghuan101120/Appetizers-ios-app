//
//  NutitionInfo.swift
//  Appetizers
//
//  Created by User on 19/03/2024.
//

import SwiftUI

struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    NutritionInfo(title: "Title", value: "Value")
}
