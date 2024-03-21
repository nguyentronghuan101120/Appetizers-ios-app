//
//  TabView.swift
//  Appetizers
//
//  Created by User on 15/03/2024.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            ListAppetizer().tabItem {
            Image(systemName: "house")
            Text("Home")
            }
            
            OrderView().tabItem {
            Image(systemName: "bag")
            Text("Order")
            }.badge(order.items.count)
            
            AccountView().tabItem {
            Image(systemName: "person")
            Text("Account")
            }
            
            
        }.accentColor(.brandPrimary )
 
    }
}

#Preview {
    MainTabView().environmentObject(Order())
}
