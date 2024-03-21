//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by User on 20/03/2024.
//

import SwiftUI

struct AppetizerCell: View {
    let item : AppetizerData
    var body: some View {
        HStack{
//            NetworkImage(urlString: item.imageURL).frame(width: 120,height: 90).cornerRadius(8)
            AsyncImage(url: URL(string: item.imageURL)){
                imageData in
                imageData.resizable().aspectRatio(contentMode: .fit).frame(width: 120,height: 90).cornerRadius(8)
            } placeholder: {
                Image("food-placeholder").resizable().aspectRatio(contentMode: .fit).frame(width: 120,height: 90).cornerRadius(8)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(item.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerCell(item: MockData.sampleAppetizer)
}
