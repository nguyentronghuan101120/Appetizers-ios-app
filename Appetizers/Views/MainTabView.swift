//
//  TabView.swift
//  Appetizers
//
//  Created by User on 15/03/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ListView().tabItem {
            Image(systemName: "house")
            Text("Home")
            }
            
            OrderView().tabItem {
            Image(systemName: "bag")
            Text("Order")
            }
            
            AccountView().tabItem {
            Image(systemName: "person")
            Text("Account")
            }
            
            
        }.accentColor(.brandPrimary )
 
    }
}

#Preview {
    MainTabView()
}
