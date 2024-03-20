//
//  OrderView.swift
//  Appetizers
//
//  Created by User on 15/03/2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){
                            appetizer in
                            AppetizerCell(item: appetizer)
                        }.onDelete(perform: order.deleteItems)
                    }.listStyle(PlainListStyle())
                    
                    AppButton(action: {}, title: "$\(order.totalPrice) - Place order")
                }
                
                if(order.items.isEmpty){
                    EmptyView(message: "You have no items in your order. Please add some!")
                }
            }
            .navigationTitle("Order")
        }
    }
    
  
}

#Preview {
    OrderView()
}
