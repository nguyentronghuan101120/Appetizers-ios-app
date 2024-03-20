//
//  EmptyView.swift
//  Appetizers
//
//  Created by User on 20/03/2024.
//

import Foundation
import SwiftUI

struct EmptyView: View {
    
    let message: String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Image("empty-order").resizable().scaledToFit().frame(height: 150)
                
                Text(message).font(.title3).fontWeight(.semibold).multilineTextAlignment(.center).foregroundColor(.secondary).padding()
            }
        }
    }
}

#Preview {
    EmptyView(message: "Hello")
}
