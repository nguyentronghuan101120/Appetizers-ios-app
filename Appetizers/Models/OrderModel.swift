//
//  OrderModel.swift
//  Appetizers
//
//  Created by User on 20/03/2024.
//

import Foundation
import SwiftUI

final class Order: ObservableObject{
    @Published var items: [AppetizerData] = []
    
    func add(_ appetizer: AppetizerData){
        items.append(appetizer)
    }
    
    func deleteItems(at offSets: IndexSet){
        items.remove(atOffsets: offSets)
    }
    
    var totalPrice: Double{
        items.reduce(0) {
            $0 + $1.price
            
        }
    }
}
