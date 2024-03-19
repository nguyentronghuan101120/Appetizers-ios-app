//
//  TodoDetailView.swift
//  TodoIOSApp
//
//  Created by User on 19/03/2024.
//

import Foundation
import SwiftUI

struct AppetizerDetailView: View {
    
    @Binding var isShowDetail: Bool

    let appetizer: AppetizerData
    var body: some View {
        VStack{
            NetworkImage(urlString: appetizer.imageURL)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            
            
            Spacer()
            
            AppButton(action: {}, title: "$\(appetizer.price) - Add to order")
            
        }.frame(width: 320,height: 525).background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40).overlay(alignment: .topTrailing) {
                CircleDismissButton{
                    isShowDetail = false
                }
            }
    }
}

#Preview {
    AppetizerDetailView(isShowDetail: .constant(true),appetizer: MockData.sampleAppetizer)
}
